function r
    set path (fd_all . $argv | fp)
    if test -d $path
	cd $path
    else if test -f $path
	nvim $path
    end
end
