function gf
    set file (cat ~/marks/files.txt | fpr)
    if test ! $status -eq 0
        return
    end

    nvim "$file"
end
