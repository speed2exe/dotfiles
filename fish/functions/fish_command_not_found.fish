function fish_command_not_found
    __fish_default_command_not_found_handler $argv[1]

    echo "pkgfile $argv[1]:"
    set result (pkgfile $argv[1])
    for p in $result
        echo " - $p"
    end
end
