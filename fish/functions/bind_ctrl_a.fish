function bind_ctrl_a
    set path (fd_all --type directory . $argv | fp)
    and cd $path
    and commandline --function repaint
end
