function fprp_optional
    set path (get_dir $argv)
    set path (fd_all . $path | fprp --query "$path/")
    if test $status -eq 0
        if [ (string match "*.." $path[1] ) ]
            echo (realpath $path[1])
        else
            echo $path[2]
        end
    else
        echo $path[1]
    end
end
