function t
    set path (navigate $argv)
    if test -f "$path"
        cd (dirname "$path")
        v (basename "$path")
    else if test -d "$path"
        cd "$path"
    end
end
