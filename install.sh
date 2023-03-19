#!/usr/bin/env zsh
# shellcheck shell=bash

set -e

SOURCE_DIR="$(cd "$(dirname "$ZSH_SCRIPT")" && pwd)"
OS_NAME="$(uname -s)"
CATEGORY_TAG=
OS_TAG="-t ${OS_NAME:l}"

if [[ -n "$1" ]]; then
  CATEGORY_TAG="-t ${1}"
fi

# link dotfiles to home directory
env RCRC="${SOURCE_DIR}/rcrc" rcup "$OS_TAG" "$CATEGORY_TAG" -v
