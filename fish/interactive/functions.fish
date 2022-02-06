# override fish greeting
function fish_greeting
    # load from save_dir
    cd (cat ~/.savedir)
    :> ~/.savedir

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

function man --description "wrap the 'man' manual page opener to use color in formatting"
  # based on this group of settings and explanation for them:
  # http://boredzo.org/blog/archives/2016-08-15/colorized-man-pages-understood-and-customized
  # converted to Fish shell syntax thanks to this page:
  # http://askubuntu.com/questions/522599/how-to-get-color-man-pages-under-fish-shell/650192

  # start of bold:
  set -x LESS_TERMCAP_md (set_color --bold blue)
  # end of all formatting:
  set -x LESS_TERMCAP_me (set_color cyan)

  # start of standout (inverted colors):
  set -x LESS_TERMCAP_so (set_color --reverse)
  # end of standout (inverted colors):
  set -x LESS_TERMCAP_se (set_color normal)
  # (no change – I like the default)

  # start of underline:
  set -x LESS_TERMCAP_us (set_color --underline)
  # end of underline:
  set -x LESS_TERMCAP_ue (set_color cyan)
  # (no change – I like the default)

  command man $argv
end

# make su launch fish
function su
   command su --shell=/usr/bin/fish $argv
end

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

# copy contents to ~/.clipboard
function copy
  if [ (count $argv) -eq 0 ]
    read -z > ~/.clipboard
  else
    $argv > ~/.clipboard
  end
end

# paste contents from ~/.clipboard
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

function get_dir
    if [ $argv ]
        realpath $argv
    else
        echo (pwd)
    end
end

# cat file or ls directory
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
