function b
    set cmd (history | fr --no-sort)
    and history delete --exact --case-sensitive $cmd
end
