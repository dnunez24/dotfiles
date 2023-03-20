# David Nunez's Dotfiles

These are my dotfiles. There are many like them, but these ones are mine.

## Overview

TODO

Managed by [rcm](https://thoughtbot.github.io/rcm/)

## Installing & Updating

```sh
# Clone this repo to the dotfiles location on your OS
git clone https://github.com/dnunez24/dotfiles.git ~/.dotfiles

# Install dotfiles for the given tags, e.g. personal or work
cd ~/.dotfiles && ./install.sh [-t TAG]

# Run the setup script to bootstrap the OS
~/.bin/setup
```

The `install.sh` is idempotent so it can also be used to update the dotfile links.

## Adding a new dotfile

You can use the `mkrc` command to create a new dotfile as in the example below:

```sh
mkrc ~/.my-dotfile

# Add a dotfile and associate with a tag
mkrc -t TAG_NAME ~/.my-dotfile
```

This will create the file in the dotfiles directory and then symlink it to the user home directory.

## Environment Specific Customization

### Shell Environment Variables

Some secrets may need to be stored in environment variables to be loaded by the shell. You can add these to a file in `~/.env` which is not included here for reasons which should be obvious. 
