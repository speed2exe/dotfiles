# setup container and shell exec
```
docker run -e TZ=Asia/Singapore -d --name dev --gpus all archlinux /usr/bin/bash -c "tail -f /dev/null"
docker exec -it dev /usr/bin/bash
```

# inside bash
```
cd ~
pacman -Syu exa fzf bat ripgrep neovim fish neofetch which gcc git trash-cli fortune-mod btop pkgfile gvfs --noconfirm
sh -c "$(curl -fsSL https://starship.rs/install.sh)" # prompts yes/no
```
# install omf and get into fish shell
```
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
```

# inside fish
```
omf install https://github.com/dracula/fish
omf reload
git clone https://github.com/speed2exe/dotfiles
dotfiles/
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fish load.fish
mkdir ~/notes
mkdir ~/screenshots
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
gh ssh-key add ~/.ssh/id_ed25519
ssh -T git@github.com
```

# update mirror list for faster packages download
```
pacman -S rsync reflector
reflector -a 10 -c sg -f 5 --sort rate --save /etc/pacman.d/mirrorlist
```

# Dependencies for Desktop Env
```
pacman -Syu picom sxhkd bspwm pinta maim rofi bsplock betterlockscreen dunst dunstify kitty noto-fonts-emoji slock thunar thunar-volum
```
- Fonts: Iosevka Term SS14 (in repo), Jost (downloadable)

# Extras to consider
- Full Dracula theme https://draculatheme.com/
- Chinese Fonts (downloadable)
- use xrandr to change display mode
