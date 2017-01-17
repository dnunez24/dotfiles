#!/usr/bin/env bash

set -ex

echo "Installing dependencies for $TRAVIS_OS_NAME"

case "$TRAVIS_OS_NAME" in
  osx )
    brew update
    brew install bats
    ;;
  * )
    wget https://github.com/sstephenson/bats/archive/v0.4.0.tar.gz -O /tmp/bats.tar.gz
    tar -xvf /tmp/bats.tar.gz
    export PATH=$PATH:$PWD/bats-0.4.0/bin
    ;;
esac
