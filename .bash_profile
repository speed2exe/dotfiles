#
# ~/.bash_profile
#

export HISTCONTROL=erasedups
export HISTSIZE=4096
export HISTFILESIZE=8192

export MANPAGER='nvim +Man!'

# login hook
[[ -z $DISPLAY && $XDG_VTNR ]] && source ~/.config/bash/clean_history

# bashrc
source ~/.bashrc
