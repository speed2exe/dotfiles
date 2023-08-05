#!/usr/bin/env bash

cd $HOME

# Copying over personal configurations
git clone https://github.com/speed2exe/dotfiles.git
mkdir $HOME/.config
mkdir $HOME/marks
cp -r dotfiles/starship.toml $HOME/.config/
cp -r dotfiles/nvim $HOME/.config/
cp -r dotfiles/fish $HOME/.config/

# Starship Prompt
curl -sS https://starship.rs/install.sh | sh -s -- -y

# Neovim
mkdir neovim && cd neovim
NEOVIM_VERSION=0.9.1
wget https://github.com/neovim/neovim/releases/download/v$NEOVIM_VERSION/nvim.appimage
chmod +x nvim.appimage
./nvim.appimage --appimage-extract
mv squashfs-root/AppRun squashfs-root/nvim
rm nvim.appimage

# Neovim Package Manager
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
