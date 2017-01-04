# Set environment variables
set -x EDITOR "atom -w"

# Fixes for Ruby JSON parser throwing errors from Chef gems
set -x LANG en_US.UTF-8
set -x LANGUAGE en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

if which rbenv > /dev/null
  set -x PATH $HOME/.rbenv/shims $PATH
  rbenv rehash >/dev/null ^&1
end
