function r
    if test -n "$argv"
        if test -d "$argv"
            set path (realpath "$argv")
        else
            set_color red ; echo "path $argv does not exists"
            return 1
        end
    else
        set path (pwd)
    end

    set dir_hash (string replace --all / : $path)

    mkdir -p ~/marks/dir_hash/"$dir_hash"/
    touch ~/marks/dir_hash/"$dir_hash"/file_history.txt

    set path (tac ~/marks/dir_hash/"$dir_hash"/file_history.txt \
        | xargs -I {} realpath --relative-to=. {} 2> /dev/null | fpr) \
        && v "$path"
end
