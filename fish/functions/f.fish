function f
    set file (cat ~/marks/files.txt | fpr)
    test ! $status -eq 0 && return

    nvim "$file"
end
