# edit saved directories
alias md "nvim ~/marks/directories.txt"

# edit saved file paths
alias mf "nvim ~/marks/files.txt"

# find directory
alias gd "commandline (tac ~/marks/directories.txt | fpr)'/'"

# quick note edit
alias ne "e ~/notes"

# quick note display
alias ns "cat (lookup_file ~/notes)"

# quick note delete
alias nd "d (lookup_file ~/notes)"

# save current directory
alias savedir "echo (pwd) > ~/.savedir"

# https://github.com/BurntSushi/ripgrep
alias grep "rg"

# Pipe to this command for no color
alias nc "sed 's/\x1b\[[0-9;]*[a-zA-Z]//g'"

# https://github.com/junegunn/fzf/
alias fp "fzf --ansi -i --preview 'echo \"show {}\" | fish'"
alias fpr "fp --layout reverse --height 30%"
alias fprp "fpr --print-query"
alias fr "fzf -i --layout reverse --height 30%"

# https://github.com/sharkdp/fd
alias fd_all "fd --hidden --no-ignore --color=always"

# always check for overwrite before copy
alias cp "cp -i"

# https://github.com/dalance/procs
alias ps "procs"

# jobs
alias j "jobs"

# https://github.com/ogham/exa
alias l "exa --icons --sort accessed --color-scale"
alias ld "l --only-dirs"
alias la "l --all"
alias ll "l --long --binary --time-style long-iso --git"
alias lla "ll -all"
alias lld "ll --only-dirs"
alias lt "ll --tree"
alias lta "lt --all"
alias ltd "lt --only-dirs"

# https://github.com/sharkdp/bat
alias bat "bat --theme Dracula"
alias cat "bat"

# search History
alias h "commandline (history | fr --no-sort)"

# repeat last command as root
alias asroot "set last (history -n 1) && commandline \"doas \$last\""
