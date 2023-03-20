# David Nunez's Dotfiles

These are my dotfiles. There are many like them, but these ones are mine.

## Overview

TODO

Managed by [rcm](https://thoughtbot.github.io/rcm/)

## Install

```sh
# Clone this repo to the dotfiles location on your OS
git clone https://github.com/dnunez24/dotfiles.git ~/.dotfiles

# Install dotfiles for the given tags, e.g. personal or work
cd ~/.dotfiles && ./install.sh [tags]

# Run the setup script to bootstrap the OS
~/.bin/setup
```

## Update

The `~/.rcrc` file gets linked during install and has most of the configuration  run the following command from the the root directory of this repo

```
cd ~/.dotfiles && ./update.sh personal
```

## Environment Specific Customization

### Shell Environment Variables

Some secrets may need to be stored in environment variables to be loaded by the shell. You can add these to a file in `~/.env` which is not included here for reasons which should be obvious. 
