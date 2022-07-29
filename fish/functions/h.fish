function h
    set cmd (history | fr)
    if test $status -eq 0
        eval "$cmd"
    end
end
