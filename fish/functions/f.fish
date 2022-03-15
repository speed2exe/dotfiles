function f
    if [ ! $argv ]
        set argv "."
    end

    set dir (get_dir $argv)
    set path (fd . $dir | fprp --query "$dir/")

    if [ $status -eq 0 ]
        if [ (string match "*.." $path[1] ) ]
            set path (realpath $path[1])
        else
            set path $path[2]
        end

        if test -d $path
            f $path
        else
            commandline -a -r $path
        end
    else
        commandline -r $dir/
    end
end
