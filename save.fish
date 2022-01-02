git stash

set folder_names fish nvim kitty neofetch fonts fontconfig \
    alacritty bspwm polybar sxhkd rofi picom

for name in $folder_names
    rm -rf $name/
    cp -r ~/.config/$name/ .
end

rm starship.toml
cp ~/.config/starship.toml .

git diff
