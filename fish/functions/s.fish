function s
    set path (fd_all | fpr)

    if test -d "$path"
        cd "$path"
    else if test -f "$path"
        nvim "$path"
    end
end
