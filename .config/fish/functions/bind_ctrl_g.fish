function bind_ctrl_g
    set git_dir (git rev-parse --show-toplevel 2> /dev/null)
    and cd "$git_dir"
    and commandline --function repaint
end
