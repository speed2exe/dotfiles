#  Important: Not valid for MacOS
set sys (uname)
switch $sys
case '*Darwin*'
    error "Not valid for MacOS"
    return
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
