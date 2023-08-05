#!/usr/bin/env bash

set -e

cp ~/.gitconfig .gitconfig
cp -r ~/.ssh .ssh

docker build -t debian-dev .
rm .gitconfig
rm -r .ssh

docker-compose up
