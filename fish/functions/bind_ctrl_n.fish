function bind_ctrl_n
    set dir (tac ~/marks/dir_history.txt \
      | awk '!x[$0]++' \
      | tee /tmp/dir_history.txt \
      | fp --no-sort)
    tac /tmp/dir_history.txt > ~/marks/dir_history.txt

    test -n "$dir" && cd $dir
    commandline --function repaint
end
