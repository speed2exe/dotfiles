function f
    set path (fd_all . $argv | fpr)
    if test -f "$path"
        v "$path"
    else if test -d "$path"
        cd "$path"
    end
    return 1
end
