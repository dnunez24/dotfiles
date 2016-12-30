function node4
  docker run --rm -it -v "$PWD:/usr/src/app" -w /usr/src/app node:4-alpine node $argv
end