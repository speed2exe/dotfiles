function compress
    if test (count "$argv") -eq 0
        error "require at least 1 arg"
        return 1
    else if test (count "$argv") -eq 1
        set type ""
        set path "$argv[1]"
    else if test (count $argv) -eq 2
        set type "$argv[1]"
        set path "$argv[2]"
    else
        error "too many args, max: 2 ([type], path)"
    end

    # set ext based on type
    switch "$type"
        case j
            set ext ".bz2"
        case z
            set ext ".gz"
    end

    # remove trailing slashes
    set target (string trim --right --chars=/ "$path")
    # add file extensions
    set target "$target.tar$ext"

    # set cmd "tar -cv"$type"f "$target" $path"
    set cmd "tar -cv"$type"f "$target" $path"
    eval "$cmd"
end
