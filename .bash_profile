#
# ~/.bash_profile
#

export PS1='$(exit_status)$(starship prompt)\n '
export MANPAGER='nvim +Man!'
export PATH=$PATH:~/.config/bash

# auto startx after login
[[ -z $DISPLAY && $XDG_VTNR ]] && startx
