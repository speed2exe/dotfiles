function f
    set file (cat ~/marks/files.txt | fpr) && nvim "$file"
end
