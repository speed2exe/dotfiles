function bind_ctrl_h
    set cmd (builtin history | fr --no-sort) && eval $cmd
    commandline --function repaint
end
