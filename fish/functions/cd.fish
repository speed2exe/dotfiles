function cd
    set prev_git (git rev-parse --show-toplevel 2> /dev/null)
    builtin cd "$argv"
    set cur_git (git rev-parse --show-toplevel 2> /dev/null)
    set cur_path "$PWD/"

    # display git info if in different git repo
    test "$cur_git" && test "$prev_git" != "$cur_git" && onefetch

    # make sure file exists
    touch /tmp/dir_history
    echo $cur_path >> /tmp/dir_history

    # print the current directory and the items in it
    echo; print_boxed "$cur_path"; echo; la
    echo "$cur_path" > /tmp/.savedir
end
