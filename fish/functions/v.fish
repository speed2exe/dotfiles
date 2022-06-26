function v
	if count $argv > /dev/null
		set path "$argv"
	else
		set path (tac ~/marks/file_history.txt | fpr)
		if test $status -eq 0
			nvim $path
		end
	end

    if test -z "$path"
        return
    end

    set splitted (string split --max 1 --right ":" "$path") # account for line number if exists
    set file "$splitted[1]"
    set line "$splitted[2]"

    if test -n "$line"
        nvim "$file" "+$line"
        return
    end

    nvim $file
end
