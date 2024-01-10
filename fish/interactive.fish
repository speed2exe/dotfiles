# set environment variables
set SHELL (which fish)
set TERM xterm-256color
set fish_term24bit 1

# apply dracula theme
source ~/.config/fish/functions/dracula.fish

# VI Key Bindings
fish_vi_key_bindings

# keybindings to insert text into current line
bind --mode insert \cf 'bind_ctrl_f'
bind --mode insert \ch 'bind_ctrl_h'
bind --mode insert \cn 'bind_ctrl_n'
bind --mode insert \ct 'bind_ctrl_t'

# keybinding for handling background jobs
bind --mode insert \cz 'bind_ctrl_z'

# use neovim for manpages
set -x MANPAGER 'nvim +Man!'
# set -x GIT_EXTERNAL_DIFF 'difft --color=always'
set -x $EDITOR nvim
