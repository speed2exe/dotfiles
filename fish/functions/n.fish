function n
    set dir (tac /tmp/dir_history ~/marks/dir_history.txt | awk '!x[$0]++' | tail -n +2 | fpr) \
        && cd $dir
end
