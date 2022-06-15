function r
	if count $argv > /dev/null
		command nvim $argv
	else
		set path (tac ~/marks/file_history.txt | fpr)
		if test $status -eq 0
			nvim $path
		end
	end
end
