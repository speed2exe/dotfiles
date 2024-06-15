function bind_ctrl_b
    set cmd (history | fr --no-sort)
    and history delete --exact --case-sensitive $cmd
    commandline --function repaint
end
