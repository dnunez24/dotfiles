# My Dotfiles

These are my dotfiles. There are many like them, but these ones are mine.

The dotfiles are managed by [rcm](https://thoughtbot.github.io/rcm/)

## Requirements

* [zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH) must be installed and in your shell `$PATH`
* [rcm](https://github.com/thoughtbot/rcm#installation) must be installed and in your shell `$PATH`


## Installing & Updating

```sh
# Clone this repo to the dotfiles location on your OS
git clone https://github.com/dnunez24/dotfiles.git ~/.dotfiles

# Install dotfiles for the given tags, e.g. personal or work
cd ~/.dotfiles && ./install.sh [-t TAG]

# Run the setup script to bootstrap the OS
~/.bin/setup
```

The `install.sh` is idempotent so it can be run again if you want to change the tags for a given system. The tags get installed into the `RCRC` config file at `~/.rcrc` so that future updates don't require the tags to be passed explicitly.

To update the dotfiles, you can simply run:

```sh
rcup -v
```

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

I use [direnv](https://github.com/direnv/direnv) to dynamically load environment variables from .envrc or .env files in the current directory. These files must be explicitly allowed to prevent automatically running a script from an untrusted directory that could do nefarious things to my system. You can run `direnv allow [file]` to allow a file or add them to the `config/direnv/direnv.toml` config file in this repo.

Some secrets may need to be stored in environment variables to be loaded by the shell. You can add these to a file in `~/.env` which is not included here for reasons which should be obvious. 
