#
# ~/.bash_profile
#

# Login
[[ -z $DISPLAY && $XDG_VTNR ]] && source ~/.config/bash/clean_history && return

export HISTCONTROL=erasedups
export HISTSIZE=4096
export HISTFILESIZE=8192

export MANPAGER='nvim +Man!'

# bashrc
source ~/.bashrc
