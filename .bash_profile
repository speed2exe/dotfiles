#
# ~/.bash_profile
#

# Login
[[ -z $DISPLAY && $XDG_VTNR ]] && source ~/.config/bash/clean_history && return

export MANPAGER='nvim +Man!'
export GIT_PAGER="delta --syntax-theme=Dracula"

# bashrc
source ~/.bashrc
