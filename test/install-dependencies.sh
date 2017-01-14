#!/usr/bin/env bash

set -e

case "$(uname)" in
  Darwin )
    brew update
    brew install bats
    ;;
  * )
    sudo git clone https://github.com/sstephenson/bats.git /usr/local/src/bats
    cd /usr/local/src/bats
    ./install.sh /usr/local
    ;;
esac
