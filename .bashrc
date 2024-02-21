#!/usr/bin/env bash

# If not running interactively, don't do anything
test -z "$PS1" && return

function exit_status {
  test $? -eq 0 && printf "\033[42m \033[0m" \
    || printf "\033[30;41m $? \033[0m"
}
PS1='$(exit_status)$(starship prompt)\n$ '

alias cat='bat --theme=Dracula'
alias xcopy='xclip -selection clipboard'
alias cd='source ~/.config/bash/cd'
alias l='exa --icons --sort accessed --color-scale=all --no-quotes'
alias la='l --all'
alias ll='l --long --binary --time-style long-iso --git'
alias lla='ll --all'

bind -x '"\C-R":"source ~/.config/bash/bind_ctrl_r"'
bind -x '"\C-N":"source ~/.config/bash/bind_ctrl_n"'
bind -x '"\C-A":"source ~/.config/bash/bind_ctrl_a"'
bind -x '"\C-H":"source ~/.config/bash/bind_ctrl_h"'
bind -x '"\C-O":"source ~/.config/bash/bind_ctrl_o"'
bind -x '"\C-E":"source ~/.config/bash/bind_ctrl_e"'
bind -x '"\C-G":"source ~/.config/bash/bind_ctrl_g"'

stty -ixon

builtin cd $(tail -n 1 ~/marks/dir_history.txt 2> /dev/null)
test -f ~/.init.bash && source ~/.init.bash || true
