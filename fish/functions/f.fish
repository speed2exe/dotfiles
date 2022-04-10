function f
    if [ ! $argv ]
        set argv "."
    end

    set dir (get_dir $argv)
    set path (fd -H -I -d 1 . $dir | fprp --query "$dir/")

    if test $status -eq 0
        if [ (string match "*.." $path[1] ) ]
            set path (realpath $path[1])
        else
            set path $path[2]
        end

        if test -d $path
            f $path
        else
            $dir/
            echo $path
            printf $path | xclip -sel clip
            set_color yellow; echo "'$path' copied to clipboard!"
        end
    else
        $dir/
    end
end
