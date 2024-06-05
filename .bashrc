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

alias v='nvim'
alias cat='bat --theme=Dracula --plain --no-pager'
alias xcopy='xclip -selection clipboard'
alias cd='source ~/.config/bash/cd'
alias l='exa --icons --sort accessed --color-scale=all --no-quotes'
alias la='l --all'
alias ll='l --long --binary --time-style long-iso --git'
alias lla='ll --all'
alias git-ref='git for-each-ref --sort=creatordate --format "%(color:red)%(refname) %(color:green)%(objectname) %(color:blue)%(creatordate) %(color:magenta)%(authorname) %(color:yellow)%(contents:subject)"'
alias git-tag='git-ref refs/tags'
alias git-graph='git log --graph --decorate --oneline --all'

# show exit status in prompt
function exit_status {
  test $? -eq 0 && printf "\033[42m \033[0m" \
    || printf "\033[30;41m $? \033[0m"
}

# nicer prompt
PS1='$(exit_status)$(starship prompt)\n$ '

# vi mode
set -o vi

# key bindings
bind -x '"\C-H":"source ~/.config/bash/fzf_rev_dir_history"'
bind -x '"\C-T":"source ~/.config/bash/fd_goto"'
bind -x '"\C-G":"source ~/.config/bash/fzf_rev_git_history"'
bind -x '"\C-R":"source ~/.config/bash/fzf_rev_cmd_history"'
bind -x '"\C-E":"source ~/.config/bash/nvim_term"'
bind -x '"\C-O":"nvim +:Telescope\ oldfiles"'
bind -x '"\C-S":"nvim +:Telescope\ live_grep"'
bind -x '"\C-F":"nvim +:Telescope\ find_files"'
bind -x '"\C-L":"clear"'
# bind -x '"\C-X":"tmux capture-pane -p -e -S -3000 | nvim -c $ -c Ansi"'
# bind -m vi-command -x '"v":"echo$ v ~/temp.bash"'

# disable default ctrl-s and ctrl-q behavior
stty -ixon

# source extra init file (if any)
test -f ~/.init.bash && source ~/.init.bash || true
