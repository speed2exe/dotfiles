function d
    if [ (count $argv) -eq 0 ]
        set path (pwd)
    else if [ -d $argv ]
        set path (get_dir $argv)
    end

    set argv (fd_all --exact-depth 1 . $path | fpr --query "$path/")

    if [ $argv ]
        commandline "trash $argv"
    end
end
