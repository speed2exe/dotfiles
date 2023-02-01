function bind_ctrl_n
    commandline --append (cat ~/marks/dir_history.txt | fpr --no-sort)
    commandline --function repaint-mode
end
