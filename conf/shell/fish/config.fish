### Configure fish ###

# do things that only make sense for an interactive shell here
if status --is-interactive
  # Set greeting to null
  set fish_greeting

  # use vi mode keybindings
  set fish_key_bindings fish_vi_key_bindings

  # Set vi mode cursor styles
  set fish_cursor_default block
  set fish_cursor_insert line
  set fish_cursor_visual block

  # Set pwd length to 1 character, e.g. ~/a/b/c/dir>
  set -U fish_prompt_pwd_dir_length 1

  # Force 256 color mode for Hyper
  set fish_term256 1
end

# Set custom bin directories in PATH
set fish_user_paths "$HOME/.bin"
set fish_user_paths $fish_user_paths "./vendor/bin"
set fish_user_paths $fish_user_paths "./node_modules/.bin"
set fish_user_paths $fish_user_paths "/usr/local/sbin"
set fish_user_paths $fish_user_paths "$HOME/.composer/vendor/bin"
set fish_user_paths $fish_user_paths "$HOME/.platformsh/bin/"
set fish_user_paths $fish_user_paths "$HOME/.magento-cloud/bin/"
set fish_user_paths $fish_user_paths "$HOME/.cargo/bin"

if test -e "/Applications/LilyPond.app"
  set fish_user_paths $fish_user_paths "/Applications/LilyPond.app/Contents/Resources/bin"
end

eval (gpg-agent --daemon)
set -x GPG_TTY (tty)

[ -f ~/.gpg-agent-info ]; and source ~/.gpg-agent-info

if [ -S "$GPG_AGENT_INFO%%" ]
    set -x GPG_AGENT_INFO
    set -x SSH_AUTH_SOCK
    set -x SSH_AGENT_PID
else
    eval (gpg-agent --daemon ~/.gpg-agent-info)
end
