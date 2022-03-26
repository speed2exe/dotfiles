function n
    set dir (cat ~/marks/dir_history.txt | fr)
    commandline "$dir/"
end
