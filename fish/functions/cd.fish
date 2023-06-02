function cd
    # previous git root
    # set prev_git (git rev-parse --show-toplevel 2> /dev/null)

    # actually change directory
    builtin cd $argv || return

    # print the current directory and the items in it
    # print_boxed "$PWD"
    # lla

    # current git root
    # set cur_git (git rev-parse --show-toplevel 2> /dev/null)

    # display git info if in different git repo
    # test "$cur_git" && test "$prev_git" != "$cur_git" && onefetch 2>/dev/null

    # update directory history
    echo "$PWD/" >> ~/marks/dir_history.txt
end
