function n
    touch /tmp/dir_history
    set dir (tac /tmp/dir_history ~/marks/dir_history.txt | tail -n +2 | fpr --no-sort)
    and cd $dir
end
