git stash

rm -r nvim/
rm -r fish/
rm -r kitty/
rm starship.toml

cp -r ~/.config/fish/ .
cp -r ~/.config/nvim/ .
cp -r ~/.config/kitty/ .
cp ~/.config/starship.toml .

git diff
