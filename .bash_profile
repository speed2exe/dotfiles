#
# ~/.bash_profile
#

export HISTCONTROL=erasedups
export HISTSIZE=4096
export HISTFILESIZE=8192

export MANPAGER='nvim +Man!'

# auto startx after login
[[ -z $DISPLAY && $XDG_VTNR ]] && startx

# load bashrc if exists
test -f ~/.bashrc && source ~/.bashrc
