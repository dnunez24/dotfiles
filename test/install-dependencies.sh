#!/usr/bin/env bash

set -ex

case "$(uname)" in
  Darwin )
    brew update
    brew install bats
    ;;
  * )
    wget https://github.com/sstephenson/bats/archive/v0.4.0.tar.gz -O /tmp/bats.tar.gz
    tar -xvf /tmp/bats.tar.gz
    export PATH=$PATH:$PWD/bats-0.4.0/bin/
    ;;
esac
