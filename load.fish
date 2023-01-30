#! /usr/bin/fish

set sys (uname)
if test "$sys" = "Darwin"
    cd ~/dotfiles/macos/
    fish load.fish
    return
end

set folder_names (cat folders.txt)

for name in $folder_names
    rm -rf ~/.config/$name/
    cp -r $name/ ~/.config/
end

rm -f ~/.config/starship.toml
cp starship.toml ~/.config/starship.toml

if test "$(uname)" = "Linux"
    rm -f ~/.xinitrc
    cp .xinitrc ~/.xinitrc
    rm -f ~/.bash_profile
    cp .bash_profile ~/.bash_profile
end
