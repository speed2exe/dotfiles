function gr
    set git_dir (git rev-parse --show-toplevel 2> /dev/null)
    if test $status -eq 0
        cd $git_dir
        return
    end

    set_color red; echo "current directory is not a git repository or in a git repository" > /dev/stderr
    return 1
end
