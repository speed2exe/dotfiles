#!/usr/bin/env bash

# rust toolchain
curl https://sh.rustup.rs -sSf | sh -s -- -y
echo "fish_add_path $HOME/.cargo/bin" >> $HOME/.init.fish
