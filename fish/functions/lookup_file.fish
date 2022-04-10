function lookup_file
    if [ ! $argv ]
        set argv "."
    end

    set path (fprp_optional $argv)
    if test -d $path
        lookup_file $path
    else
        echo $path
    end
end
