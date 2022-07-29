function n
    set dir (cat ~/marks/dir_history.txt | fpr) && cd "$dir"
end
