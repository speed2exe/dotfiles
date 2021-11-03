# setup container and shell exec
```
docker run -e TZ=Asia/Singapore -d --name dev --gpus all archlinux /usr/bin/bash -c "tail -f /dev/null"
docker exec -it dev /usr/bin/bash
```

# inside bash
```
cd ~
pacman -Syu exa fzf bat ripgrep neovim fish neofetch which gcc git --noconfirm
sh -c "$(curl -fsSL https://starship.rs/install.sh)" # prompts yes/no
```
# install omf and get into fish shell
```
curl -L https://get.oh-my.fish | fish 
```

# inside fish
```
omf install https://github.com/h-matsuo/fish-color-scheme-switcher
omf reload
scheme set zenburn
git clone https://github.com/speed2exe/dotfiles
dotfiles/
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fish load.fish
touch ~/.savedir
touch ~/.clipboard
mkdir ~/notes
mkdir ~/marks
touch ~/marks/directories.txt
touch ~/marks/files.txt
```

# change default shell to fish
```
chsh -s /bin/fish
```

# update all packages
```
pacman -Syu $(pacman -Qq)
```

# github auth
```
pacman -Syu github-cli openssh
gh auth login
ssh-keygen -t ed25519 -C "speed2exe@live.com.sg"
eval (ssh-agent -c)
ssh-add ~/.ssh/id_ed25519
gh auth refresh -h github.com -s admin:public_key
gh ssh-key add ~/.ssh/id_ed25519.pub
ssh -T git@github.com
```
