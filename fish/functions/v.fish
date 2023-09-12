function v
    set splitted (string split --max 2 --right ":" "$argv") # account for line number if exists
    set file "$splitted[1]"
    set line "$splitted[2]"
    set column "$splitted[3]"

    if test -n "$column"
        nvim "$file" "+call cursor($line, $column)"
    else if test -n "$line"
        nvim "$file" "+$line"
    else if test -f "$file"
        nvim "$file"
    else
        error "File not found: $file"
    end
end
