# set environment variables
set SHELL (which fish)
set TERM xterm-256color
set fish_term24bit 1

# apply dracula theme
source ~/.config/fish/functions/dracula.fish

# VI Key Bindings
fish_vi_key_bindings

bind --mode insert \ch 'bind_ctrl_h'
bind --mode insert \cn 'bind_ctrl_n'
bind --mode insert \ct 'bind_ctrl_t'
bind --mode insert \cr 'bind_ctrl_r'
bind --mode insert \ca 'bind_ctrl_a'
bind --mode insert \cu 'bind_ctrl_u'
bind --mode insert \co 'bind_ctrl_o'
bind --mode insert \cf 'bind_ctrl_f'
bind --mode insert \ct 'bind_ctrl_t'
bind --mode insert \cs 'bind_ctrl_s'
bind --mode insert \cb 'bind_ctrl_b'
bind --mode insert \ce 'bind_ctrl_e'
bind --mode insert \cg 'bind_ctrl_g'

# keybinding for handling background jobs
bind --mode insert \cz 'bind_ctrl_z'

# use neovim for manpages
set -x MANPAGER 'nvim +Man!'

# https://direnv.net/docs/hook.html#fish
direnv hook fish | source
