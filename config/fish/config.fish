set -U fish_greeting

[ -f "$HOME/.env" ] && export (cat "$HOME/.env")

# do things that only make sense for an interactive shell here
if status --is-interactive
  # use vi mode keybindings
  set fish_key_bindings fish_vi_key_bindings

  # Set vi mode cursor styles
  set fish_cursor_default block
  set fish_cursor_insert line
  set fish_cursor_visual block
end

# Set default editor to Atom
set -x EDITOR "code -w"

# Set composer home directory
set -x COMPOSER_HOME "$HOME/.composer"
set -x GEM_HOME "$HOME/.gem"

# Fixes for Ruby JSON parser throwing errors from Chef gems
set -x LANG en_US.UTF-8
set -x LANGUAGE en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

# Set custom bin directories in PATH
set fish_user_paths \
  "$HOME/.bin" \
  "./vendor/bin" \
  "./node_modules/.bin" \
  "/usr/local/sbin" \
  "$COMPOSER_HOME/vendor/bin" \
  "$HOME/.cargo/bin" \
  "$HOME/Library/Python/2.7/bin" \
  "/usr/local/opt/flutter/bin" \
  "$GEM_HOME/bin" \
  "$HOME/.pub-cache/bin" \
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" \
  $fish_user_paths


if test -n "$has_gpg_keys"
  # Configure GPG agent
  set -x GPG_TTY "(tty)"
  set -e SSH_AGENT_PID
  set -q gnupg_SSH_AUTH_SOCK_by || set gnupg_SSH_AUTH_SOCK_by 0

  if test "$gnupg_SSH_AUTH_SOCK_by" -ne %self
    set -x SSH_AUTH_SOCK "(gpgconf --list-dirs agent-ssh-socket)"
    # gpg-connect-agent updatestartuptty /bye
    gpgconf --launch gpg-agent
  end
else
  eval (ssh-agent -c)
end

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/dnunez/GitHub/dotfiles/node_modules/tabtab/.completions/serverless.fish ] && source /Users/dnunez/GitHub/dotfiles/node_modules/tabtab/.completions/serverless.fish

# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/dnunez/GitHub/dotfiles/node_modules/tabtab/.completions/sls.fish ] && source /Users/dnunez/GitHub/dotfiles/node_modules/tabtab/.completions/sls.fish

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.fish ] && source /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.fish

# The next line updates PATH for the Google Cloud SDK.
[ -f "$HOME/google-cloud-sdk/path.fish.inc" ] && source "$HOME/google-cloud-sdk/path.fish.inc"

if status --is-interactive
  set -g fish_user_abbreviations
  abbr --add dkr docker
  abbr --add dkrc docker-compose
end

eval (starship init fish)
