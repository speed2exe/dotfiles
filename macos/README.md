# MacOS

```bash
# ~
ln -s ~/github.com/speed2exe/dotfiles/.bash_profile ~/.bash_profile

# ~/.config
## same with linux
mkdir -p ~/.config && cd ~/.config
ln -s ~/github.com/speed2exe/dotfiles/.config/starship.toml starship.toml
ln -s ~/github.com/speed2exe/dotfiles/.config/nvim          nvim
ln -s ~/github.com/speed2exe/dotfiles/.config/bash          bash
ln -s ~/github.com/speed2exe/dotfiles/.config/tmux          tmux
ln -s ~/github.com/speed2exe/dotfiles/.config/nix           nix
ln -s ~/github.com/speed2exe/dotfiles/.config/alacritty     alacritty
ln -s ~/github.com/speed2exe/dotfiles/.config/direnv        direnv

## special stuff for macos
ln -s ~/github.com/speed2exe/dotfiles/macos/skhd    skhd
ln -s ~/github.com/speed2exe/dotfiles/macos/yabai   yabai
ln -s ~/github.com/speed2exe/dotfiles/macos/borders borders
```
