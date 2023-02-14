function bind_ctrl_n
    commandline --append (cat ~/marks/dir_history.txt | fp --no-sort)
    commandline --function repaint-mode
end
