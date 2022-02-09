function gr
    echo
    la $argv
    set path (lookup_dir $argv)
    if [ $status -ne 0 ]
        commandline "cd $path"
    else
        gr $path
    end
end
