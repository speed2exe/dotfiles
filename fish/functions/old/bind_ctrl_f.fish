function bind_ctrl_f
    commandline --insert (fd_all . $argv | fp --no-sort)
    commandline --function repaint-mode
end
