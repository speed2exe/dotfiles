function t
    set path (navigate $argv)
    test -f $path && v $path
end
