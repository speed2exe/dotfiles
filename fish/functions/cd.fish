function cd
    # actually change directory
    builtin cd $argv || return

    # update directory history
    mkdir -p ~/marks
    echo "$PWD/" >> ~/marks/dir_history.txt

    # update git directory history (root of git repo)
    set git_dir (git rev-parse --show-toplevel 2> /dev/null)
    if success
      echo "$git_dir/" >> ~/marks/git_dir_history.txt
    end
end
