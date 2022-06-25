function r
    set pwd (pwd)
    set dir_hash (string replace --all / : $pwd)
    echo "$dir_hash"

    if count $argv > /dev/null
        command nvim $argv
        return
    end

    mkdir -p ~/marks/dir_hash/$dir_hash/
    touch ~/marks/dir_hash/$dir_hash/file_history.txt

    set path (tac ~/marks/dir_hash/$dir_hash/file_history.txt \
        | xargs -I {} realpath --relative-to=. {} 2> /dev/null | fpr)

    if test $status -eq 0
        nvim $path
    end
end
