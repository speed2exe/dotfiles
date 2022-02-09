function get_dir
    if [ $argv ]
        realpath $argv
    else
        echo (pwd)
    end
end
