#  Important: Not valid for MacOS
if (uname -a | grep -q Darwin)
    echo "This script is not valid for MacOS"
    exit 1
end

set folder_names (cat folders.txt)

git stash

for name in $folder_names
    rm -rf $name/
    cp -r ~/.config/$name/ .
end

rm starship.toml
cp ~/.config/starship.toml .

rm .xinitrc
cp ~/.xinitrc .

git add .
git diff --cached
git status
