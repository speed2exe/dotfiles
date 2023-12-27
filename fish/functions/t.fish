function t
    set path (navigate $argv) # ~/.config/fish/functions/navigate.fish
    if test -f "$path"
        cd (dirname "$path")
        $EDITOR (basename "$path")
    else if test -d "$path"
        cd "$path"
    end
end
