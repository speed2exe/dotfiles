function r
	set pwd (pwd)
	set dir_hash (string replace --all / : $pwd)
	if count $argv > /dev/null
		command nvim $argv
        return
    end

    set path (tac ~/marks/dir_hash/$dir_hash/file_history.txt | fpr)
    if test $status -eq 0
        nvim $path
    end
end
