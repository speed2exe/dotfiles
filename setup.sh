#!/usr/bin/env fish

# curl https://raw.githubusercontent.com/speed2exe/dotfiles/main/setup.sh | bash

cd ~
git clone https://github.com/speed2exe/dotfiles.git --depth=1
cd dotfiles
./load
cd
