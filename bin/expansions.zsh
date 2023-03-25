#!/bin/zsh

echo
echo "value of VAR if set, else null"
echo

echo "unset VAR"
unset VAR
echo "\${VAR} -> ${VAR}"

echo

echo "VAR="
unset VAR && VAR=
echo "\${VAR} -> ${VAR}"

echo

echo "VAR=hello"
unset VAR && VAR="hello"
echo "\${VAR} -> ${VAR}"

echo
echo "========================================="
echo
echo "1 if VAR is null or set, else 0"
echo

echo "unset VAR"
unset VAR
echo "\${+VAR} -> ${+VAR}"

echo

echo "VAR="
unset VAR && VAR=
echo "\${+VAR} -> ${+VAR}"

echo

echo "VAR=hello"
unset VAR && VAR="hello"
echo "\${+VAR} -> ${+VAR}"

echo
echo "========================================="
echo
echo "value of VAR if null or set, else default"
echo

echo "unset VAR"
unset VAR
echo "\${VAR-default} -> ${VAR-default}"

echo

echo "VAR="
unset VAR && VAR=
echo "\${VAR-default} -> ${VAR-default}"

echo

echo "VAR=hello"
unset VAR && VAR=hello
echo "\${VAR-default} -> ${VAR-default}"

echo
echo "========================================="
echo
echo "value of VAR if set, else default"
echo

echo "unset VAR"
unset VAR
echo "\${VAR:-default} -> ${VAR:-default}"

echo

echo "VAR="
unset VAR && VAR=
echo "\${VAR:-default} -> ${VAR:-default}"

echo

echo "VAR=hello"
unset VAR && VAR="hello"
echo "\${VAR:-default} -> ${VAR:-default}"

echo
echo "========================================="
echo
echo "default if VAR is null or set, else null"
echo

echo "unset VAR"
unset VAR
echo "\${VAR+default} -> ${VAR+default}"

echo

echo "VAR="
unset VAR && VAR=
echo "\${VAR+default} -> ${VAR+default}"

echo

echo "VAR=hello"
unset VAR && VAR="hello"
echo "\${VAR+default} -> ${VAR+default}"

echo
echo "========================================="
echo
echo "default if VAR is set, else null"
echo

echo "unset VAR"
unset VAR
echo "\${VAR:+default} -> ${VAR:+default}"
echo

echo "VAR="
unset VAR && VAR=
echo "\${VAR:+default} -> ${VAR:+default}"
echo

echo "VAR=hello"
unset VAR && VAR="hello"
echo "\${VAR:+default} -> ${VAR:+default}"
echo

echo
echo "========================================="
echo
echo "default if VAR is unset, else value of VAR"
echo

echo "unset VAR"
unset VAR
echo "\${VAR=default} -> ${VAR=default}"
echo

echo "VAR="
unset VAR && VAR=
echo "\${VAR=default} -> ${VAR=default}"
echo

echo "VAR=hello"
unset VAR && VAR="hello"
echo "\${VAR=default} -> ${VAR=default}"
echo

echo
echo "========================================="
echo
echo "default if VAR is null or unset, else value of VAR"
echo

echo "unset VAR"
unset VAR
echo "\${VAR:=default} -> ${VAR:=default}"
echo

echo "VAR="
unset VAR && VAR=
echo "\${VAR:=default} -> ${VAR:=default}"
echo

echo "VAR=hello"
unset VAR && VAR="hello"
echo "\${VAR:=default} -> ${VAR:=default}"
echo

echo
echo "========================================="
echo
echo "default value always"
echo

echo "unset VAR"
unset VAR
echo "\${VAR::=default} -> ${VAR::=default}"
echo

echo "VAR="
unset VAR && VAR=
echo "\${VAR::=default} -> ${VAR::=default}"
echo

echo "VAR=hello"
unset VAR && VAR="hello"
echo "\${VAR::=default} -> ${VAR::=default}"
echo

# TODO: trap quit signals
# unsetopt ERR_EXIT

echo
echo "========================================="
echo
echo "value if VAR is null or set, else print message and exit"
echo

echo "unset VAR"
unset VAR
unset RESULT && RESULT=$(echo ${VAR?message})
echo "\${VAR?message} -> $RESULT"
echo

echo "VAR="
unset VAR && VAR=
unset RESULT && RESULT=$(echo ${VAR?message})
echo "\${VAR?message} -> $RESULT"
echo

echo "VAR=hello"
unset VAR && VAR="hello"
RESULT=$(echo ${VAR?message})
echo "\${VAR?message} -> $RESULT"
echo

echo
echo "========================================="
echo
echo "value if VAR set, else print message and exit"
echo

unset VAR && echo "unset VAR"
unset RESULT && RESULT=$(echo ${VAR:?message})
echo "\${VAR:?message} -> $RESULT"
echo

unset VAR && VAR=
echo "VAR=$VAR"
unset RESULT && RESULT=$(echo ${VAR:?message})
echo "\${VAR:?message} -> $RESULT"
echo

unset VAR && VAR="hello"
echo "VAR=$VAR"
RESULT=$(echo ${VAR:?message})
echo "\${VAR:?message} -> $RESULT"
echo

echo
echo "========================================="
echo
echo "unmatched portion of VAR if pattern matches beginning"
echo

unset VAR && echo "unset VAR"
echo "\${VAR#hello } -> ${VAR#hello }"
echo

unset VAR && VAR=
echo "VAR=$VAR"
echo "\${VAR#hello } -> ${VAR#hello }"
echo

unset VAR && VAR="hello foo"
echo "VAR=$VAR"
echo "\${VAR#hello } -> ${VAR#hello }"
echo

echo
echo "========================================="
echo
echo "unmatched portion of VAR if pattern matches beginning"
echo

unset VAR && echo "unset VAR"
echo "\${VAR#hello } -> ${VAR#hello }"
echo

unset VAR && VAR=
echo "VAR=$VAR"
echo "\${VAR#hello } -> ${VAR#hello }"
echo

unset VAR && VAR="hello hello foo"
echo "VAR=\"$VAR\""
echo "\${VAR##hello } -> ${VAR##hello }"
echo
