git stash

rm -r fish/
rm -r nvim/
rm -r kitty/
rm -r neofetch/
rm -r fonts/
rm starship.toml

cp -r ~/.config/fish/ .
cp -r ~/.config/nvim/ .
cp -r ~/.config/kitty/ .
cp -r ~/.config/neofetch/ .
cp -r ~/.config/fonts/ .
cp ~/.config/starship.toml .

git diff
