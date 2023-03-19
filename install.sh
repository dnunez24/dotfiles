#!/usr/bin/env zsh
# shellcheck shell=bash

SOURCE_DIR="$(cd "$(dirname "$ZSH_SCRIPT")" && pwd)"
OS_NAME="$(uname -s)"
# shellcheck disable=SC2034
RCUP_TAGS_ARRAY=("${@}" "${OS_NAME:l}")
# shellcheck disable=SC2296
RCUP_TAGS=${(j: -t :)RCUP_TAGS_ARRAY}

# link dotfiles to home directory
env RCRC="${SOURCE_DIR}/rcrc" rcup -v "-t ${RCUP_TAGS[*]}"
