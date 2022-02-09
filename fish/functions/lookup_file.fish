function lookup_file
    if [ ! $argv ]
        set argv "."
    end

    set path (fprp_optional $argv)
    if [ -d $path ]
        lookup_file $path
    else
        echo $path
    end
end
