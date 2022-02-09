function m
    if [ (count $argv) -eq 0 ]
        echo (pwd) >> ~/marks/directories.txt
    else
        for arg in $argv
            if test -z $arg
                continue
            end
            set arg (string trim $arg)

            set path (realpath $arg)
            if test -d $path
                echo $path >> ~/marks/directories.txt
            else if test -e $path
                echo $path >> ~/marks/files.txt
            else
                set splitted (string split : $arg)
                set splitted[1] (realpath $splitted[1])
                if test -e $splitted[1]
                    echo "$splitted[1]:$splitted[2]" >> ~/marks/files.txt
                else
                    set_color red; echo "invalid path: $arg"
                end
            end
        end
    end
end
