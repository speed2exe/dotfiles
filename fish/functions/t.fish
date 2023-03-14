function t
    set path (navigate $argv) # ~/.config/fish/functions/navigate.fish
    if test -f "$path"
        cd (dirname "$path")
        v (basename "$path")
    else if test -d "$path"
        cd "$path" && t
    end
end
