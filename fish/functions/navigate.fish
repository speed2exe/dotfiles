function navigate
    if test -z "$argv"
        set argv "."
    else if not test -d "$argv"
        echo "$argv: not a directory"
        return 1
    end

    set dir (realpath "$argv")"/"
    set path (fd_all "$argv" --absolute-path --exact-depth 1 | fprp --query "$dir")

    set input "$path[1]"
    set selection "$path[2]"

    if test (string match "*.." "$input") # user inputs ".."
        t "$input"
    else if test -d "$selection"
        t "$selection"
    else if test -f "$selection"
        printf "$selection"
    else
        printf "$dir"
    end
end
