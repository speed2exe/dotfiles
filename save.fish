git stash

set folder_names fish nvim kitty neofetch fonts fontconfig \
    alacritty bspwm polybar sxhkd rofi picom dunst kitty gtk-3.0

for name in $folder_names
    rm -rf $name/
    cp -r ~/.config/$name/ .
end

rm starship.toml
cp ~/.config/starship.toml .

git add .
git diff --cached
git status
