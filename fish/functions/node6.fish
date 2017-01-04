function node6
  docker run --rm -it -v "$PWD:/usr/src/app" -w /usr/src/app node:6-alpine node $argv
end