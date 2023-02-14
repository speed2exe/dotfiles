function r
    if test -n "$argv"
        if test -d "$argv"
            set path (realpath "$argv")
        else
            error "path $argv does not exists"
            return
        end
    else
        set path (pwd)
    end

    set dir_hash (string replace --all / : $path)

    mkdir -p ~/marks/dir_hash/"$dir_hash"/
    touch ~/marks/dir_hash/"$dir_hash"/file_history.txt

    set path (tac ~/marks/dir_hash/"$dir_hash"/file_history.txt \
        | xargs -I {} realpath --relative-to=. {} 2> /dev/null | fp --no-sort)
    and v "$path"
end
