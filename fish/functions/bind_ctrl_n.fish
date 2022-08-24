function bind_ctrl_n
    commandline --insert (cat ~/marks/dir_history.txt | fpr)
    commandline --function repaint-mode
end
