function gitroot
    set gitroot (git rev-parse --show-toplevel 2> /dev/null)
    if test -n $gitroot
        "$gitroot/"
    end
end
