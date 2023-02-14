function bind_ctrl_f
    commandline --append (fd_all . $argv | fp --no-sort)
    commandline --function repaint-mode
end
