#!/opt/homebrew/bin/fish

# starship
rm -f ~/.config/starship.toml && cp ~/dotfiles/starship.toml ~/.config/starship.toml

# fish
rm -rf ~/.config/fish/ && cp -r ~/dotfiles/fish/ ~/.config/fish/
cat ~/dotfiles/macos/pre_config.fish ~/dotfiles/fish/config.fish > ~/.config/fish/config.fish

# neovim
rm -rf ~/.config/nvim/ && cp -r ~/dotfiles/nvim/ ~/.config/nvim/
sed -i -e 's/set\ shell=\/usr\/sbin\/fish/set\ shell=\/opt\/homebrew\/bin\/fish/' ~/.config/nvim/setttings.vim

# alacritty
# https://github.com/alacritty/alacritty/issues/1359
# https://github.com/alacritty/alacritty/issues/5782
rm -rf ~/.config/alacritty/ && cp -r ~/dotfiles/alacritty/ ~/.config/alacritty/
printf '\nkey_bindings:
  - { key: N,        mods: Command, action: CreateNewWindow  }
  - { key: Q,        mods: Control, chars: "\\\\x11"           }
  - { key: V,        mods: Option,  action: Paste            }
  - { key: C,        mods: Option,  action: Copy             }
  - { key: Equals,   mods: Option,  action: IncreaseFontSize }
  - { key: Minus,    mods: Option,  action: DecreaseFontSize}
  - { key: D,        mods: Option,  action: ScrollPageDown   }
  - { key: U,        mods: Option,  action: ScrollPageUp     }
  - { key: J,        mods: Option,  action: ScrollLineDown   }
  - { key: K,        mods: Option,  action: ScrollLineUp     }
  - { key: G,        mods: Option,  action: ScrollToBottom   }
  - { key: Space,    mods: Option,  action: ToggleViMode     }' >> ~/.config/alacritty/alacritty.yml
sed -i -e 's/iosevka2/Iosevka\ Nerd\ Font/g' ~/.config/alacritty/alacritty.yml
sed -i -e 's/xdg\-open/open/g' ~/.config/alacritty/alacritty.yml
sed -i -e 's/\/bin\/fish/\/opt\/homebrew\/bin\/fish/g' ~/.config/alacritty/alacritty.yml
