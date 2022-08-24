function bind_ctrl_s
    commandline --append (fd_all . $argv | fpr)
    commandline --function repaint-mode
end
