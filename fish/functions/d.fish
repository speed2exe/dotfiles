function d
    if [ (count $argv) -eq 0 ]
        set path (pwd)
    else if test -d $argv
        set path (get_dir $argv)
    else if test -f $argv
        trash $argv
        return
    end

    set argv (fd_all --exact-depth 1 . $path | fpr --query "$path/")
    if test $status -eq 0
        trash $argv
    end
end
