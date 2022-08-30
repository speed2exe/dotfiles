function f
    set path (fd_all . $argv | fpr)
    if test -f "$path"
        v "$path"
    else
        cd "$path"
    end
end
