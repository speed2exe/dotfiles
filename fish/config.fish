# omf
# https://github.com/oh-my-fish/oh-my-fish

# fisher
# https://github.com/jorgebucaran/fisher

set TERM xterm-256color  
set fish_term24bit 1

if status is-interactive
    # load from save_dir 
    cd (cat ~/.savedir)

    # Intro
    echo "you got this bro!"

    # https://opensourcelibs.com/lib/fish-color-scheme-switcher
    scheme set zenburn

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

    # Display Dope stuff
    neofetch
end

# gcloud
alias gcloud /root/google-cloud-sdk/bin/gcloud

# Go
fish_add_path /usr/local/go/bin
set GOPATH $HOME/go
fish_add_path $GOROOT/bin
fish_add_path $GOPATH/bin

# Ruby
fish_add_path "/root/.local/share/gem/ruby/3.0.0/bin"

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

# set history_path "~/.local/share/fish/fish_history"
# function add_to_history
#     set timestamp (date '+%s')
#     set cmd $argv[1]
#     set paths $argsv[2..]
#     echo "- cmd: $cmd" >> $history_path
#     echo "- when: $timestamp" >> $history_path
#     if [ (count $paths) ]
#         echo "- paths:"
#         for path in $paths
#             echo "    - $path"
#         end
#     end
# end

# https://github.com/sharkdp/bat
alias bat "bat --theme Dracula"
alias cat "bat"
function show
    if [ (count $argv) -eq 0 ]
        set path (find . | fpr)
        if [ $path ]
            show $path
        end
    else if [ (count $argv) -ne 1 ]
        set_color red; echo "invalid arguments: $argv"
    else if test -d $argv
        ll $argv
    else
        set file (string split : $argv)
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
# alias fp "fzf -i --preview ' echo \"if [ -d {} ] ; ll {} ; else ; bat --color=always --style=numbers --line-range=:500 {}\" | fish '"
alias fp "fzf -i --preview 'echo \"show {}\" | fish'"
alias fpr "fp --layout reverse --height 30%"
alias fprp "fpr --print-query"
alias fr "fzf -i --layout reverse --height 30%"

function get_dir
    if [ $argv ]
        realpath $argv
    else
        echo (pwd)
    end
end

function fprp_optional
    set path (get_dir $argv)
    set path (find $path | fprp --query "$path/")
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
    set path (find $path -type d | fprp --query "$path/")

    if [ (string match "*/.." $path[1]) ]
        echo "$path[1]"
    else if [ $path[2] ] 
        echo "$path[2]"
    else
        echo $argv
        return 1
    end
end

function g
    set path (lookup_dir $argv)
    commandline "cd $path"
end

# same as g but keeps going until stopped
function gr
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
function h
    set cmd (history | fr --no-sort) && commandline $cmd
end

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

# like rm but can be use for both file or folder
function delete_file_or_dir
    if [ -d $argv ]
        commandline "rm -r $argv"
    else
        commandline "rm $argv"
    end
end

# quick delete path or file
function d
    if [ (count $argv) -eq 0 ]
        set path (pwd)
        set argv (find $path | fpr --query "$path/")
    else if [ -d $argv ]
        set path (get_dir $argv)
        set argv (find $path | fpr --query "$path/")
    end
    
    if [ $argv ] 
        delete_file_or_dir $argv
    end
end

# quick note access
function fzf_notes_path
    set path (find ~/notes | fpr --print-query --query ~/notes/)
    if [ $status -eq 0 ] 
        echo $path[2]
    else
        echo $path[1]
    end
end

# quick note edit
function ne
    e ~/notes
end

# quick note display
function ns
    set path (lookup_file ~/notes)
    commandline "cat $path"
end

# quick note delete
function nd
    d ~/notes
    set path (fzf_notes_path)
    if [ $path ] 
        delete_file_or_dir $path
    end
end

# save current directory
function savedir
    echo (pwd) > ~/.savedir
end

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

function md
    nvim ~/marks/directories.txt
end

function mf
    nvim ~/marks/files.txt
end

# find directory
function gd
    commandline (cat ~/marks/directories.txt | fpr)
    commandline -i "/"
end

# find files
function gf
    set file (cat ~/marks/files.txt | fpr)
    set splitted (string split ":" $file)
    if [ (count $splitted) -ne 2 ]
        commandline "nvim $file"
    else
        commandline "nvim +$splitted[2] $splitted[1]"
    end
end

# warning/todo: works very slow if there are many contents, and still loading after it's done looking
# Search for file name or file content, jumps to nvim and edit at line number
function s
   find -type f | xargs -I {} echo "cat -n {} | tac | sed 's/ *//' | awk '{print \"{}:\"\$0}' " | fish | fzf -i --exact --no-sort | awk '{print $1}' | awk -F ':' '{print "nvim +"$2" "$1}' | fish
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
