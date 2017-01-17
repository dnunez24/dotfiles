#!/usr/bin/env bats

load test_helper

@test "Adds fish to /etc/shells" {
  run grep -q fish /etc/shells
  assert_success
}

@test "Sets default shell to fish" {
  case "$(uname)" in
    Darwin )
      expected="$(dscl . -read $HOME UserShell | cut -d' ' -f 2)"
      ;;
    * )
      expected="$(getent passwd $LOGNAME | cut -d: -f7)"
      ;;
  esac
  actual="/usr/local/bin/fish"
  assert_equal $expected $actual
}
