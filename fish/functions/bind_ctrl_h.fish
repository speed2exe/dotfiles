function bind_ctrl_h
    commandline --insert (history | fr)
    commandline --function repaint-mode
end
