function nvim
    set splitted (string split --max 1 --right ":" "$argv") # account for line number if exists
    if test (count $splitted) -eq 0
        command nvim "$argv"
    else
        command nvim "+$splitted[2]" "$splitted[1]"
    end
end
