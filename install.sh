#!/usr/bin/env zsh
# shellcheck shell=bash

SCRIPT_NAME="${0}"
OS_NAME="$(uname -s)"

usage() {
  cat <<- EOF

$(basename "${SCRIPT_NAME}") [-t TAG] [FILE]

    Installs dotfiles using rcm: https://thoughtbot.github.io/rcm/

    Any options or positional parameters passed to this script
    will be forwarded to the rcup command that does the install.

    Typical use is to pass one or more tags.

    You can install only certain files by specifying files as
    positional parameters to the script.
EOF
  exit 1
}

install() {
  # link dotfiles to home directory
  rcup -K -v -t "${OS_NAME:l}" "${@}" rcrc
  rcup -v -t "${OS_NAME:l}" "${@}"
}

while getopts ':h' opt; do
  case $opt in
    h) usage;;
    *) install "${@}";;
  esac
done

