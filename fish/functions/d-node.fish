function d-node -d "Run node via Docker"
  docker run --rm -it -v "$PWD:/usr/src/app" -w /usr/src/app node:alpine node $argv
end
