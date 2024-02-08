function bind_ctrl_h
    commandline --insert (history | fr --no-sort)
    commandline --function repaint-mode
end
