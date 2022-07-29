function t
    if test -z "$argv"
        set argv "."
    else if not test -d "$argv"
        echo "$argv: not a directory"
        return 1
    end

    set dir (realpath "$argv")
    set path (fd_all "$argv" --absolute-path --exact-depth 1 | fprp --query "$dir/")

    set input "$path[1]"
    set selection "$path[2]"

    if test (string match "*.." "$input")
        t "$input"
    else if test -d "$selection"
        t "$selection"
    else if test -f "$selection"
        cd (dirname "$selection")
        nvim "$selection"
    else
        cd "$dir"
    end
end
