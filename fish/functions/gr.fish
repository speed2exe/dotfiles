function gr
    set git_dir (git rev-parse --show-toplevel 2> /dev/null) \
        && cd "$git_dir" \
        && return
    error "current directory is not a git repository or in a git repository" > /dev/stderr
    return 1
end
