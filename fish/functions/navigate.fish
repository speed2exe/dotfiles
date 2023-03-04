function navigate
    if test -z "$argv"
        set argv "."
    else if not test -d "$argv"
        error "$argv: not a directory"
        return
    end

    set dir (realpath "$argv")"/"
    fd_all "$argv" --absolute-path --exact-depth 1 | fp \
        --query "$dir" \
        --bind "right:become(cd {} && navigate)" \
        --bind "left:become(cd .. && navigate)" \
        --bind "esc:print-query" \

end
