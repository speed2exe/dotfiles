#!/usr/bin/env bash

# Copying dotfiles
git clone https://github.com/speed2exe/dotfiles.git
mkdir ~/.config
cp -r dotfiles/starship.toml ~/.config/
cp -r dotfiles/nvim ~/.config/
cp -r dotfiles/fish ~/.config/

# Neovim Package Manager
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Starship Prompt
curl -sS https://starship.rs/install.sh | sh -s -- -y

# personal marks
mkdir $HOME/marks

# Neovim
cd $HOME
mkdir neovim && cd neovim
NEOVIM_VERSION=0.9.1
wget https://github.com/neovim/neovim/releases/download/v$NEOVIM_VERSION/nvim.appimage
chmod +x nvim.appimage
./nvim.appimage --appimage-extract
mv squashfs-root/AppRun squashfs-root/nvim
rm nvim.appimage
