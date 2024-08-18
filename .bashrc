#
# ~/.bashrc
#

# exit if not running interactively
test -z "$PS1" && return

# attach to tmux session if exists
if command -v tmux &> /dev/null; then
  if [ -z "$TMUX" ]; then
    UNATTACHEDS=$(tmux list-session -f '#{==:#{session_attached},0}' -F '#{session_name}')
    for UNATTACHED in $UNATTACHEDS; do
      if [ "${UNATTACHED:0:1}" = "_" ]; then
        exec tmux attach-session -t "$UNATTACHED"
      fi
    done
    exec tmux new -s _$RANDOM
  fi
fi

alias e='source ~/.config/bash/edit'
alias cat='bat --theme=Dracula --plain --no-pager'
alias xcopy='xclip -selection clipboard'
alias cd='source ~/.config/bash/cd'
alias l='exa --icons --sort accessed --color-scale=all --no-quotes --dereference'
alias la='l --all'
alias ll='l --long --binary --time-style long-iso --git'
alias lla='ll --all'
alias git-ref='git for-each-ref --sort=creatordate --format "%(color:red)%(refname) %(color:green)%(objectname) %(color:blue)%(creatordate) %(color:magenta)%(authorname) %(color:yellow)%(contents:subject)"'
alias git-tag='git-ref refs/tags'
alias git-graph='git log --graph --decorate --oneline --all'
alias git-blame='source ~/.config/bash/git_blame'
alias clean-history='source ~/.config/bash/clean_history'
alias v='tmux capture-pane -p -e -S -3000 | nvim -c ":%s/\v\n{2,}$/\r/" -c "Ansi"'

# show exit status in prompt
function exit_status {
  test $? -eq 0 && printf "\033[42m \033[0m" \
    || printf "\033[30;41m $? \033[0m"
  local COUNT=$(jobs | wc -l)
  test $COUNT -ne 0 && printf "\033[30;100m $COUNT \033[0m"
}

# nicer prompt
PS1='$(exit_status) $(starship prompt)\n$ '

# save and load command line
bind -x '"\M-1":"source ~/.config/bash/save_cmd_line && clear"'
bind -x '"\M-2":"source ~/.config/bash/load_cmd_line"'

# key bindings
bind '"\C-T":"\M-1source ~/.config/bash/fzf_nav_rec\n\M-2"'
bind '"\C-H":"\M-1source ~/.config/bash/fzf_rev_dir_history\n\M-2"'
bind '"\C-G":"\M-1source ~/.config/bash/fzf_rev_git_dir_history\n\M-2"'
bind '"\C-F":"\M-1source ~/.config/bash/fzf_fd\n\M-2"'
bind -x '"\C-R":"source ~/.config/bash/fzf_rev_cmd_history"'
bind -x '"\C-E":"source ~/.config/bash/nvim_term"'
bind -x '"\C-O":"source ~/.config/bash/fzf_nvim_oldfiles"'
bind -x '"\C-S":"source ~/.config/bash/fzf_rg"'
bind -x '"\C-L":"clear"'
bind -x '"\C-X":"source ~/.config/bash/fzf_tmux_line"'
bind -x '"\C-A":"source ~/.config/bash/fzf_tmux_word"'
# bind -x '"\C-N":"source ~/.config/bash/fzf_comp"'
# bind -x '"\C-X":"tmux capture-pane -p -e -S -3000 | nvim -c $ -c Ansi"'
# bind -m vi-command -x '"v":"echo$ v ~/temp.bash"'

# disable default ctrl-s and ctrl-q behavior
stty -ixon

# source extra init file (if any)
test -f ~/.init.bash && source ~/.init.bash || true
