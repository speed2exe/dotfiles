function n
    touch /tmp/dir_history
    set dir (tac /tmp/dir_history ~/marks/dir_history.txt | fp --no-sort)
    and cd $dir

    update_dir_history &
end
