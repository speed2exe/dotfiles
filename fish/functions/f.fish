function f
    touch ~/marks/files.txt
    set file (cat ~/marks/files.txt | fpr) && nvim "$file"
end
