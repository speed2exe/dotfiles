function cd
    # actually change directory
    builtin cd $argv || return

    # update directory history
    mkdir -p ~/marks
    echo "$PWD/" >> ~/marks/dir_history.txt
end
