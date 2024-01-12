function bind_ctrl_r
    set path (fd_all . $argv | fp)
    if test -d $path
	cd $path
	commandline --function repaint
    else if test -f $path
	$EDITOR $path
    end
end
