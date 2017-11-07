### Configure fish ###

# do things that only make sense for an interactive shell here
if status --is-interactive
  # use vi mode keybindings
  set fish_key_bindings fish_vi_key_bindings

  # Set vi mode cursor styles
  set fish_cursor_default block
  set fish_cursor_insert line
  set fish_cursor_visual block
end

# Set custom bin directories in PATH
set fish_user_paths "$HOME/.bin"
set fish_user_paths $fish_user_paths (brew --prefix homebrew/php/php71)/bin
set fish_user_paths $fish_user_paths "./vendor/bin"
set fish_user_paths $fish_user_paths "./node_modules/.bin"
set fish_user_paths $fish_user_paths "/usr/local/sbin"
set fish_user_paths $fish_user_paths "$HOME/.composer/vendor/bin"
set fish_user_paths $fish_user_paths "$HOME/.platformsh/bin/"
set fish_user_paths $fish_user_paths "$HOME/.cargo/bin"

if test -e "/Applications/LilyPond.app"
  set fish_user_paths $fish_user_paths "/Applications/LilyPond.app/Contents/Resources/bin"
end

# Configure GPG agent
set -x GPG_TTY (tty)
set -e SSH_AGENT_PID
set -q gnupg_SSH_AUTH_SOCK_by; or set gnupg_SSH_AUTH_SOCK_by 0

if test "$gnupg_SSH_AUTH_SOCK_by" -ne %self
  set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
end

set -x EDITOR "atom -w"
set -x NVM_DIR "$HOME/.nvm"
set -x COMPOSER_HOME "$HOME/.composer"

# Fixes for Ruby JSON parser throwing errors from Chef gems
set -x LANG en_US.UTF-8
set -x LANGUAGE en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8


