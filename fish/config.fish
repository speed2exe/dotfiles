# omf
# https://github.com/oh-my-fish/oh-my-fish

# fisher
# https://github.com/jorgebucaran/fisher

set TERM xterm-256color  
set fish_term24bit 1

function fish_greeting
    # execute command if there is
    set cmd (cat ~/.cmd)
    if test $cmd
        $cmd
        :> ~/.cmd
    else
        echo
        neofetch && set_color brblack; fortune
    end
end

if status is-interactive
    clear

    # load from save_dir 
    cd (cat ~/.savedir)
    :> ~/.savedir

    # https://starship.rs/
    starship init fish | source
    set STARSHIP_CONFIG "~/.config/starship.toml"

    # VI Key Bindings
    fish_vi_key_bindings
    function fish_mode_prompt
        switch $fish_bind_mode
        case default
            echo -en "\e[2 q"
        case insert
            echo -en "\e[6 q"
        end
    end
end

# matrx screensaver
alias n "cmatrix -as -u 7 -C blue"

# pacman
alias inst "sudo pacman -Syu"
alias uninst "sudo pacman -Rcns"

# gcloud
alias gcloud "/root/google-cloud-sdk/bin/gcloud"

# git root
alias gitroot "git rev-parse --show-toplevel"

fish_add_path "~/.local/bin"
fish_add_path "/home/zx/.local/bin"

# Go
#fish_add_path /usr/local/go/bin
#fish_add_path /usr/lib/go/bin
#set GOPATH $HOME/go
#fish_add_path $GOROOT/bin
#fish_add_path $GOPATH/bin

# Ruby
fish_add_path "/root/.local/share/gem/ruby/3.0.0/bin"

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
function show
    if [ (count $argv) -eq 0 ]
        set path (fd_all --exact-depth 1 . | fpr)
        if [ $path ]
            show $path
        end
    else if [ (count $argv) -ne 1 ]
        set_color red; echo "invalid arguments: $argv"
    else if test -d $argv
        ll $argv
    else
        set file (string split : $argv) # handle case for file with line number
        if [ (count $file) -ne 2 ]
            bat --color=always --style=numbers $argv
        else
            set line_start (math $file[2] - 5)
            if [ $line_start -lt 0 ]
                set line_start 0
            end

            bat --color=always --style=numbers --line-range $line_start: --highlight-line $file[2]: $file[1]
        end
    end
end

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

function get_dir
    if [ $argv ]
        realpath $argv
    else
        echo (pwd)
    end
end

# returns fzf result if found, elso return user input
function fprp_optional
    set path (get_dir $argv)
    set path (fd_all . $path | fprp --query "$path/")
    if [ $status -eq 0 ] 
        if [ (string match "*.." $path[1] ) ]
            echo (realpath $path[1])
        else
            echo $path[2]
        end
    else
        echo $path[1]
    end
end

function lookup_file
    if [ ! $argv ] 
        set argv "."
    end

    set path (fprp_optional $argv)
    if [ -d $path ]
        lookup_file $path
    else
        echo $path
    end
end

# find and change to that directory
function lookup_dir
    set path (get_dir $argv)
    set path (fd_all --type d . $path | fprp --query "$path/")

    if [ (string match "*/.." $path[1]) ]
        echo "$path[1]"
    else if [ $path[2] ] 
        echo "$path[2]"
    else
        echo $argv
        return 1
    end
end

# quick navigate to directory
function g
    commandline (lookup_dir $argv)'/'
end

# same as g but keeps going until stopped
function gr
    echo
    la $argv
    set path (lookup_dir $argv)
    if [ $status -ne 0 ]
        commandline "cd $path"
    else
        gr $path
    end
end

# open editor if argument is not empty
function edit_file
    if [ $argv ]
        commandline "nvim $argv"
    end
end

# find edit file using fzf
function e
    edit_file (lookup_file $argv)
end

# History
alias h "commandline (history | fr --no-sort)"

# create file and make path if not available
function t
    set splitted (string split --right --max 1 / $argv)
    if [ (count $splitted) -eq 1 ]
        commandline "touch $argv"
    else
        commandline "mkdir -p $splitted[1] && touch $argv"
    end
end

# quick create file or directory
function c
    if [ ! (count $argv) -eq 1 ]
        echo "count must be 1"
        return
    end

    set trimmed (string trim --right --chars "/" $argv)
    if [ $status -eq 0 ] # is path
        commandline "mkdir -p $trimmed"
    else
        t $argv
    end
end

# quick delete path or file
function d
    if [ (count $argv) -eq 0 ]
        set path (pwd)
    else if [ -d $argv ]
        set path (get_dir $argv)
    end

    set argv (fd_all --exact-depth 1 . $path | fpr --query "$path/")
    
    if [ $argv ] 
        commandline "trash $argv"
    end
end

# quick note edit
alias ne "e ~/notes"

# quick note display
alias ns "cat (lookup_file ~/notes)"

# quick note delete
alias nd "d (lookup_file ~/notes)"

# save current directory
alias savedir "echo (pwd) > ~/.savedir"

# mark
function m
    if [ (count $argv) -eq 0 ]
        echo (pwd) >> ~/marks/directories.txt
    else
        for arg in $argv
            if test -z $arg
                continue
            end
            set arg (string trim $arg)

            set path (realpath $arg)
            if test -d $path
                echo $path >> ~/marks/directories.txt
            else if test -e $path
                echo $path >> ~/marks/files.txt
            else
                set splitted (string split : $arg)
                set splitted[1] (realpath $splitted[1])
                if test -e $splitted[1]
                    echo "$splitted[1]:$splitted[2]" >> ~/marks/files.txt
                else
                    set_color red; echo "invalid path: $arg"
                end
            end
        end
    end
end

# edit saved directories
alias md "nvim ~/marks/directories.txt"

# edit saved file paths
alias mf "nvim ~/marks/files.txt"

# find directory
alias gd "commandline (tac ~/marks/directories.txt | fpr)'/'"

# find files
function gf
    set file (tac ~/marks/files.txt | fpr)
    set splitted (string split ":" $file) # account for line number if exists
    if [ (count $splitted) -ne 2 ]
        commandline "nvim $file"
    else
        commandline "nvim +$splitted[2] $splitted[1]"
    end
end

# warning/todo: works very slow if there are many contents, and still loading after it's done looking
# Search for file name or file content, jumps to nvim and edit at line number
function s
   fd_all -type f . | xargs -I {} echo "cat -n {} | tac | sed 's/ *//' | awk '{print \"{}:\"\$0}' " | fish | fzf -i --exact --no-sort | awk '{print $1}' | awk -F ':' '{print "nvim +"$2" "$1}' | fish
end

function copy 
  if [ (count $argv) -eq 0 ]
    read -z > ~/.clipboard
  else 
    $argv > ~/.clipboard
  end
end

function paste
    cat ~/.clipboard
end

# cht.sh
function learn
  printf "$argv" | sed "s/ /\//g" | xargs -I {} curl cht.sh/{} 
end

# compress
function compress
    if test (count $argv) -eq 1
        set type ""
        set path $argv[1]
    else
        set type $argv[1]
        set path $argv[2]
    end

    # set ext based on type
    switch $type
        case j
            set ext ".bz2"
        case z
            set ext ".gz"
    end

    # remove trailing slashes
    set target (string trim --right --chars=/ $path)
    # add file extensions
    set target $target".tar$ext"

    set cmd "tar -cv"$type"f "$target" $path"
    commandline $cmd
end

alias mktar "compress"
alias mktgz "compress z"
alias mktbz "compress j"

# extract
function extract
    if test ! -f $argv
        echo "extract expects a path to file"
        return 1
    end

    set path $argv
    switch $path
        case '*.tar.bz2'
            tar xvjf $path; return
        case '*.tar.gz'
            tar xvzf $path; return
        case '*.bz2'
            bunzip2 $path; return
        case '*.rar'
            rar x $path; return
        case '*.gz'
            gunzip $path; return
        case '*.tar'
            tar xvf $path; return
        case '*.tbz2'
            tar xvjf $path; return
        case '*.tgz'
            tar xvzf $path; return
        case '*.zip'
            unzip $path; return
        case '*.Z'
            uncompress $path; return
        case '*.7z'
            7z x $path; return
        case '*.zip'
            unzip $path; return
        case '*'
            echo "unknown file extension for extraction"
            return 1
    end
end

# zip
function mkzip
    if test (count $argv) -ne 1
        echo "requires 1 arg: path to file/folder"
    end

    commandline "zip -vr $argv.zip $argv"
end
