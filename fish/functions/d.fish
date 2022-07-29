function d
    set dir (cat ~/marks/directories.txt | fpr)'/' && cd "$dir"
end
