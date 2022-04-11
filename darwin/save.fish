set folder_names (cat folders.txt)

git stash

for name in $folder_names
    rm -rf ../$name
    cp -r ~/.config/$name/ $name/
end

rm ../starship.toml
cp ~/.config/starship.toml ..

git add .
git diff --cached
git status
