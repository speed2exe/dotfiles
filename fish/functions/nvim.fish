function nvim
    set splitted (string split --max 1 --right ":" "$argv") # account for line number if exists
    set count (count $splitted)
    if test $count -eq 2
        command nvim "+$splitted[2]" "$splitted[1]"
    else
        if test -n "$argv"
            command nvim $argv
        else
            command nvim
        end
    end
end
