#!/usr/bin/env bash

case "$(uname)" in
  Darwin )
    brew update
    brew install bats
    ;;
  * )
    git clone https://github.com/sstephenson/bats.git /usr/local/src/bats
    cd /usr/local/src/bats
    ./install.sh /usr/local
    ;;
esac
