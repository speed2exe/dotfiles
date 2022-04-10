function e
    set f (lookup_file $argv)
    if test -f $f
        nvim $f
    end
end
