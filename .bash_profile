#
# ~/.bash_profile
#

export MANPAGER='nvim +Man!'
export PATH=$PATH:~/.config/bash

# auto startx after login
[[ -z $DISPLAY && $XDG_VTNR ]] && startx

# load bashrc if exists
test -f ~/.bashrc && source ~/.bashrc
