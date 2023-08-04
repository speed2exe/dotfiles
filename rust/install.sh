#!/usr/bin/env bash

set -e

cp ~/.gitconfig .gitconfig
cp -r ~/.ssh .ssh

docker build -t rust-img .
rm .gitconfig
rm -r .ssh
# docker rm -f rust-cont || true
# docker run --add-host=host.docker.internal:host-gateway --name rust-cont -d rust-img
# docker exec -it rust-cont fish
docker-compose up -d
