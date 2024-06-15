function get_dir
    test $argv
    and realpath "$argv"
    or echo (pwd)
end
