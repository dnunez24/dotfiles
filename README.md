# David Nunez's Dotfiles

These are my dotfiles. There are many like them, but these ones are mine.

## Overview

TODO

Managed by [rcm](https://thoughtbot.github.io/rcm/)

## Install

```sh
$ init/bootstrap
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
