function g
    set dir (lookup_dir $argv)
    if test $status -eq 0
        $dir
    end
end
