function navigate
    if test -z "$argv"
        set argv "."
    else if not test -d "$argv"
        error "$argv: not a directory"
        return
    end

    set dir (realpath "$argv")"/"
    set path (fd_all "$argv" --absolute-path --exact-depth 1 | fprp --query "$dir")

    set input "$path[1]"
    set selection "$path[2]"

    if test (string match "*.." "$input") # user inputs ".."
        navigate "$input"
    else if test -d "$selection"
        navigate "$selection"
    else if test -f "$selection"
        printf "$selection"
    else if test -n "$input"
        error "no such file or directory: $input"
        navigate "$dir"
    else if test -z "$selection"
        printf "$dir"
    end
end
