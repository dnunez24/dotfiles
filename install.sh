#!/usr/bin/env zsh
# shellcheck shell=bash

SCRIPT_NAME="${0}"
OS_NAME="$(uname -s)"
DEFAULT_RCRC="$HOME/.rcrc"

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
  # TODO: install rcm or exit with message requiring it to be installed first
  # Give install instructions based on OS
  # https://github.com/thoughtbot/rcm#installation

  local TAGS
  TAGS=("${OS_NAME:l}")

  while getopts ':t:' opt; do
    case $opt in
      t) TAGS+=("$OPTARG");;
      *) usage;;
    esac
  done

  # Remove the options from ${@} so that only the positional params
  # will be stored in that variable for usage in later commands.
  shift $OPTIND-1

  # Copy the rcrc file to ~/.rcrc so that the system specific tags
  # can be written to it without affecting the version controlled
  # base template.
  rcup -K -v -C -I rcrc rcrc

  # Overwrite the empty tags from the base template with the OS tag
  # (detected by this script) and whatever additional tags are passed
  # to this script.
  MATCH='^TAGS='
  TO_REPLACE='"[^"]*"'
  # shellcheck disable=SC2128
  REPLACEMENT="\"$TAGS\""

  if [[ -f $DEFAULT_RCRC ]]; then
    echo "Updating $DEFAULT_RCRC with your tags..."
    # shellcheck disable=SC2086
    sed -Ei "" "/$MATCH/s/$TO_REPLACE/$REPLACEMENT/" $DEFAULT_RCRC
  fi

  # Symlink the rest of the dotfiles (either all of them or the ones
  # that are explicitly passed to this script as positional params).
  TAG_FLAG=("-t")
  rcup -x rcrc ${TAG_FLAG:^^TAGS} -v "${@}"
}

while getopts ':h' opt; do
  case $opt in
    h) usage;;
    *) install "${@}";;
  esac
done

