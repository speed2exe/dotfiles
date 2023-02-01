function bind_ctrl_f
    commandline --append (fd_all . $argv | fpr --no-sort)
    commandline --function repaint-mode
end
