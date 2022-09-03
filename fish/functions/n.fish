function n
    set dir (cat ~/marks/dir_history.txt /tmp/dir_history | fpr) && cd $dir
end
