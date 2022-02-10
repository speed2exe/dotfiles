set folder_names (cat folders.txt)

for name in $folder_names
    rm -rf ~/.config/$name/
    cp -r $name/ ~/.config/
end

rm -f ~/.config/starship.toml
cp starship.toml ~/.config/starship.toml
