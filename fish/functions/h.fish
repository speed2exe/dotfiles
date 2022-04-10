function h
    set cmd (history | fr --no-sort)
    if test $status -eq 0
        eval $cmd
    end
end
