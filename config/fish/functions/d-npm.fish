function d-npm -d "Run npm via Docker"
  docker run --rm -it -v "$PWD:/usr/src/app" -w /usr/src/app node:alpine npm $argv
end
