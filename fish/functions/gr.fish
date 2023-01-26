function gr
    set git_dir (git rev-parse --show-toplevel 2> /dev/null)
    and cd "$git_dir"
    and return
    or error "current directory is not a git repository or in a git repository"
end
