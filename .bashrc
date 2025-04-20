#
# ~/.bashrc
#

# exit if not running interactively
test -z "$PS1" && return

# set custom prompt
PS1='$(test $? -eq 0 && printf "\033[42m \033[0m" || printf "\033[30;41m $? \033[0m") $(starship prompt)\n$ '

# set environment variables
export MANPAGER='nvim +Man!'
# export GIT_PAGER="delta --syntax-theme=Dracula"
export FZF_DEFAULT_OPTS='--ansi --color=16 --inline-info --select-1 --exit-0'

# attach to tmux session if exists
if command -v tmux &> /dev/null; then
  if [ -z "$TMUX" ]; then
    # Set terminal colors in a single printf call
    printf '\033]4;0;#21222c\033\\\033]4;1;#ff5555\033\\\033]4;2;#50fa7b\033\\\033]4;3;#f1fa8c\033\\\033]4;4;#bd93f9\033\\\033]4;5;#ff79c6\033\\\033]4;6;#8be9fd\033\\\033]4;7;#f8f8f2\033\\\033]4;8;#6272a4\033\\\033]4;9;#ff6e6e\033\\\033]4;10;#69ff94\033\\\033]4;11;#ffffa5\033\\\033]4;12;#d6acff\033\\\033]4;13;#ff92df\033\\\033]4;14;#a4ffff\033\\\033]4;15;#ffffff\033\\\033]10;#aaaaaa\033\\'

    UNATTACHEDS=$(tmux list-session -f '#{==:#{session_attached},0}' -F '#{session_name}')
    for UNATTACHED in $UNATTACHEDS; do
      if [ "${UNATTACHED:0:1}" = "_" ]; then
        exec tmux attach-session -t "$UNATTACHED"
      fi
    done
    exec tmux new -s _$RANDOM
  fi
fi

# set commonly used aliases
alias e='source ~/.config/bash/edit'
alias cat='bat --theme=Dracula --plain --no-pager'
alias xcopy='xclip -selection clipboard'
alias cd='source ~/.config/bash/cd'
alias l='exa --icons --sort accessed --color-scale=all --no-quotes --color=always'
alias la='l --all'
alias ll='l --long --binary --time-style long-iso --git'
alias lla='ll --all'
alias git-ref='git for-each-ref --sort=creatordate --format "%(color:red)%(objectname) %(color:blue)%(creatordate) %(color:reset)%(refname) %(color:green)%(tagger)%(author) %(color:yellow)%(contents:subject)"'
alias git-tag='git-ref refs/tags'
alias git-graph='git log --graph --decorate --oneline --all'
alias git-blame='source ~/.config/bash/git_blame'
alias git-ls='source ~/.config/bash/git_ls'
alias v='tmux capture-pane -p -e -S -3000 | nvim -c ":%s/\v\n{2,}$/\r/" -c "Ansi" -c "set buftype=nofile"'
alias gh-copilot-suggest-shell='gh copilot suggest --target shell'
# alias use-nix='echo use nix > .envrc && direnv allow'
# alias clean-history='source ~/.config/bash/clean_history'

# disable keybinds not applicable for modern terminals
stty -ixon
stty susp undef

# Keybind utils to save and load command line
bind -x '"\M-0":"source ~/.config/bash/save_cmd_line"'
bind -x '"\M-1":"source ~/.config/bash/load_cmd_line"'

# Keybinds involving changing directory
bind -x '"\M-2":"source ~/.config/bash/fzf_rev_dir_history"'
bind -x '"\M-3":"source ~/.config/bash/fzf_fd"'
bind -x '"\M-4":"source ~/.config/bash/fzf_nav_rec"'
bind -x '"\M-5":"source ~/.config/bash/goto_git_root"'

# Keybinds
bind '"\C-a":"\M-0\M-2\n\M-1"'
bind '"\C-f":"\M-0\M-3\n\M-1"'
bind '"\C-t":"\M-0\M-4\n\M-1"'
bind '"\C-g":"\M-0\M-5\n\M-1"'
bind -x '"\C-r":"source ~/.config/bash/fzf_rev_cmd_history"'
bind -x '"\C-e":"source ~/.config/bash/nvim_term"'
bind -x '"\C-o":"source ~/.config/bash/fzf_nvim_oldfiles"'
bind -x '"\C-s":"source ~/.config/bash/fzf_rg"'
bind -x '"\C-x":"source ~/.config/bash/fzf_exe"'
bind -x '"\C-q":"source ~/.config/bash/delete_history_entry"'
bind -x '"\C-l":"clear"'
# bind -x '"\C-k":"v"'
bind -x '"\C-y":"source ~/.config/bash/clipboard_copy"'
bind -x '"\C-z":"tmux choose-tree"'
# bind -x '"\C-p":"source ~/.config/bash/clipboard_paste"'
# bind -x '"\C-n":"source ~/.config/bash/new_term"'
# bind -x '"\C-l":"source ~/.config/bash/fzf_tmux_line"'
# bind -x '"\C-;":"source ~/.config/bash/fzf_tmux_word"'
bind -x '"\C-k":"source ~/.config/bash/fzf_tmux"'
# bind -x '"\C-n":"source ~/.config/bash/fzf_comp"'
# bind -x '"\C-x":"tmux capture-pane -p -e -S -3000 | nvim -c $ -c Ansi"'
# bind -m vi-command -x '"v":"echo$ v ~/temp.bash"'
# bind -x '"\C-l":"clear"'

# Source extra init file (if any)
test -f ~/.init.bash && source ~/.init.bash || true
