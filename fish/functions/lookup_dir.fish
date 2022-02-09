function lookup_dir
    set path (get_dir $argv)
    set path (fd_all --type d . $path | fprp --query "$path/")

    if [ (string match "*/.." $path[1]) ]
        echo "$path[1]"
    else if [ $path[2] ]
        echo "$path[2]"
    else
        echo $argv
        return 1
    end
end
