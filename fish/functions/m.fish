function m
    if [ (count $argv) -eq 0 ]
        echo (pwd) >> ~/marks/directories.txt
        sort ~/marks/directories.txt -o ~/marks/directories.txt
    else
        for arg in $argv
            if test -z "$arg"
                continue
            end
            set arg (string trim "$arg")

            set path (realpath "$arg")
            if test -d "$path"
                echo "$path" >> ~/marks/directories.txt
                sort ~/marks/directories.txt -o ~/marks/directories.txt
            else if test -e "$path"
                echo "$path" >> ~/marks/files.txt
                sort ~/marks/files.txt -o ~/marks/files.txt
            else
                set splitted (string split --max 1 --right : "$arg")
                set splitted[1] (realpath "$splitted[1]")
                if test -e "$splitted[1]"
                    echo "$splitted[1]:$splitted[2]" >> ~/marks/files.txt
                    sort ~/marks/files.txt -o ~/marks/files.txt
                else
                    error "invalid path: $arg"
                end
            end
        end
    end
end
