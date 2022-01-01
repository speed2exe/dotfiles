set folder_names fish nvim fish kitty neofetch fonts fontconfig \
    alacritty bspwm polybar sxhkd rofi

for name in $folder_names
    rm -rf ~/.config/$name/
    cp -r $name/ ~/.config/
end

rm -f ~/.config/starship.toml
cp starship.toml ~/.config/starship.toml
