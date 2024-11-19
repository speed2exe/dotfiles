#
# ~/.bash_profile
#

# Login
[[ -z $DISPLAY && $XDG_VTNR ]] && return

export HISTCONTROL=erasedups
export HISTSIZE=4096
export HISTFILESIZE=8192

export MANPAGER='nvim +Man!'
export GIT_PAGER="delta --syntax-theme=Dracula"
export FZF_DEFAULT_OPTS='--ansi --color=16 --inline-info --select-1 --exit-0'

# bashrc
source ~/.bashrc
