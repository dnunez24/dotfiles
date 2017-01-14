#!/usr/bin/env bats

load test_helper

@test "symlinks dotfiles to $HOME/.dotfiles" {
  expected="$(dirname "$BATS_TEST_DIRNAME")/"
  actual="$(readlink "$HOME/.dotfiles")"
  assert_equal $expected $actual
}

@test ".gitconfig content matches dotfiles version" {
  expected="$BATS_TEST_DIRNAME/../gitconfig"
  actual="$HOME/.gitconfig"
  run diff -q "$expected" "$actual"
  assert_success ""
}
