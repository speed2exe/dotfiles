function navigate
    if test -z "$argv"
        set argv "."
    else if not test -d "$argv"
        error "$argv: not a directory"
        return
    end

    set dir (realpath "$argv")"/"
    # because fd doesn't return the current directory and previous directory
    printf "$dir..\n$dir\n" > /tmp/navigate_history
    fd_all "$dir" --absolute-path --exact-depth 1 >> /tmp/navigate_history
    set dest (cat /tmp/navigate_history | fp --query "$dir" --bind "esc:change-query($dir)")
    rm /tmp/navigate_history

    if test "$dest" = "$dir"
        printf "$dest"
    else if test -d "$dest"
        navigate "$dest"
    else if test -f "$dest"
        printf "$dest"
    end
end
