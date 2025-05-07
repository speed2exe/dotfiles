#!/usr/bin/env bash

# Download config and load into machine
curl -L "https://github.com/speed2exe/dotfiles/archive/refs/heads/main.tar.gz" -o dotfiles.tar.gz
rm -rf ~/dotfiles && tar -C ~/ -xzf dotfiles.tar.gz
mv dotfiles-main dotfiles

# Install Nix Package Manager
# https://nixos.org/download/#nix-install-linux
sh <(curl -L https://nixos.org/nix/install) --daemon

# Install Home Manager
# https://nix-community.github.io/home-manager/index.xhtml#sec-install-standalone
export USER=$(whoami)
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
home-manager init

# Add programs to Home Manager
sed -i 's/home.packages = /home.packages = with pkgs; /' ~/.config/home-manager/home.nix
pkgs=(
    git direnv gh starship
    ripgrep procs delta
    fd neovim fzf eza bat
    btop kalker
)
for pkg in "${pkgs[@]}"; do
    sed -i "/home.packages = with pkgs;/a \    $pkg" ~/.config/home-manager/home.nix
done
