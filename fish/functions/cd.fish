function cd
    # actually change directory
    builtin cd $argv || return

    # update directory history
    echo "$PWD/" >> ~/marks/dir_history.txt
end
