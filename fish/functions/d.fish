function d
    touch ~/marks/directories.txt
    set dir (cat ~/marks/directories.txt | fpr)'/' && cd "$dir"
end
