function bind_ctrl_t
    set path (navigate $argv) # ~/.config/fish/functions/navigate.fish
    if test -f "$path"
        cd (dirname "$path")
	commandline --function repaint
        $EDITOR (basename "$path")
    else if test -d "$path"
        cd "$path"
	commandline --function repaint
    end
end
