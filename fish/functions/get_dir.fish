function get_dir
    if test $argv
        realpath "$argv"
    else
        echo (pwd)
    end
end
