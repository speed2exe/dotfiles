function bind_ctrl_n
    commandline --insert (history | fr --no-sort)
    commandline --function repaint-mode
end
