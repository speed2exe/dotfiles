git stash

rm -r nvim/
rm -r fish/
rm -r kitty/

cp -r ~/.config/fish/ .
cp -r ~/.config/nvim/ .
cp -r ~/.config/kitty/ .

git diff
