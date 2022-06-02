function n
    set dir (cat ~/marks/dir_history.txt | fpr)
    if test $status -eq 0
        $dir/
    end
end
