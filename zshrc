# Set zsh opts
setopt autocd

# Load environment variables file
[[ -f "$HOME/.env" ]] && . "$HOME/.env"
# c072ff992f9ebac36bc0ebb5b511a87f

export COMPOSER_HOME="$HOME/.composer"
export GEM_HOME="$HOME/.gem"

if [[ "$(uname -a)" =~ "darwin" ]]; then
  export CHARLES_HOME="/Applications/Charles.app/Contents/MacOS"
fi

# If you come from bash you might have to change your $PATH.
paths=()

bin_dirs=(
  # dotfiles bins
  "$HOME/bin"

  # Homebrew package bins
  "/usr/local/sbin"

  # Rust bins
  "$HOME/.cargo/bin"

  # Flutter bins
  "/usr/local/opt/flutter/bin"

  # Python poetry package manager
  "$HOME/.poetry/bin"

  # Python user installed modules
  "$HOME/Library/Python/3.9/bin"

  # PHP composer package bins
  "$COMPOSER_HOME/vendor/bin"

  # Ruby gem bins
  "$GEM_HOME/bin"

  # Dart package bins
  "$HOME/.pub-cache/bin"

  # Charles proxy CLI
  "$CHARLES_HOME"
)

for dir in ${bin_dirs[@]}; do
  if [[ -d "${dir}" ]]; then
    paths+=("${dir}")
  fi
done

# Default paths last in lookup chain
paths+=("$PATH")

export PATH=${(j/:/)paths}

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  1password
  aws
  docker
  docker-compose
  git
  gh
  npm
  volta
  vscode
  volta
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Set default editor to VS Code
export EDITOR="code -w"

# TODO: add to a tag specific config or load from .env
export AWS_PROFILE="iamr-dotcom-snkrs-team"

export PIPENV_VENV_IN_PROJECT=1

# Configure Volta (https://volta.sh) for Node.js version management
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Configuration for delta pager (https://github.com/dandavison/delta)
export DELTA_PAGER="less"

# Set ripgrep config file path
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# Set the home directory for Groovy SDK
export GROOVY_HOME=/opt/homebrew/opt/groovy/libexec

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias zshrc="code -w $HOME/.zshrc"
alias la="ls -Alp"

# Alias to find files using ripgrep and paginate / syntax highlight using delta
search() {
  rg "${@:1}" --json -C 3 | delta
}

# Autoload all custom functions
autoload -Uz $ZSH/functions/**/*(-.:t)

bindkey -v

cmd_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Initialize starship shell prompt
cmd_exists starship && eval "$(starship init zsh)"

# Initialize pyenv for managing Python versions
cmd_exists pyenv && eval "$(pyenv init -)"

# Initialize direnv for loading .envrc / .env files
cmd_exists direnv && eval "$(direnv hook zsh)"

# Warpify zsh subshells without requiring confirmation
printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "zsh"}}\x9c'
