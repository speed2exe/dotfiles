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

# Go
fish_add_path /usr/local/go/bin
set GOPATH $HOME/go
fish_add_path $GOROOT/bin
fish_add_path $GOPATH/bin

# Ruby
fish_add_path "/root/.local/share/gem/ruby/3.0.0/bin"

# nvim
alias v "nvim"
alias vi "nvim"
alias vim "nvim"

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
alias cat "bat"
function show
    if [ (count $argv) -eq 0 ]
        set path (find . | fpr)
        if [ $path ]
            show $path
        end
    else if [ -d $argv ] 
        ll $argv
    else
        cat --color=always --style=numbers $argv
  end
end

# https://github.com/BurntSushi/ripgrep
alias grep "echo Use 'rg' instead"

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
    set cmd (history | fr --no-sort) && $cmd
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
        set argv (find $path | fpr --query $path)
    else if [ -d $argv ]
        set path (get_dir $argv)
        set argv (find $path | fpr --query $path)
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

