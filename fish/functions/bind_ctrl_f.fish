function bind_ctrl_f
    commandline --append (fd_all . $argv | fpr)
    commandline --function repaint-mode
end
