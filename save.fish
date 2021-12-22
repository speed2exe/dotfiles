git stash

rm -r nvim/
rm -r fish/
rm -r kitty/
rm -r neofetch/
rm starship.toml

cp -r ~/.config/fish/ .
cp -r ~/.config/nvim/ .
cp -r ~/.config/kitty/ .
cp -r ~/.config/neofetch/ .
cp ~/.config/starship.toml .

git diff
