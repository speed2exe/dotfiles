function h
    set cmd (builtin history | fr --no-sort) && eval $cmd
end
