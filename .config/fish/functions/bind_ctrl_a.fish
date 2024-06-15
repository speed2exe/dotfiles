function bind_ctrl_a
    set dir (tac ~/marks/git_dir_history.txt \
      | awk '!x[$0]++' \
      | tee /tmp/git_dir_history.txt \
      | fp --no-sort)
    tac /tmp/git_dir_history.txt > ~/marks/git_dir_history.txt

    test -n "$dir" && cd $dir
    commandline --function repaint
end
