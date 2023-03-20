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

For updating a personal MacOS system, run the following command from the the root directory of this repo

```
env RCRC="./tag-personal/rcrc" rcup 
```

For updating a work MacOS system, run the following command from the the root directory of this repo

```
env RCRC="./tag-work/rcrc" rcup 
```

## Customize

TODO

## Secrets

### Environment Variables

Some secrets may need to be stored in environment variables to be loaded by the shell. You can add these to a file in `~/.config/fish/conf.d` which is not included here for reasons which should be obvious. The file name must end in `.fish`. You might name it something like `secrets.fish`.

### Other Files

Other secret files, like SSH private keys, must be copied over manually from wherever you're securely storing them. Place them in the appropriate folders.
