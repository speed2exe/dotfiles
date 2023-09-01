function t
    set path (navigate $argv) # ~/.config/fish/functions/navigate.fish
    if test -f "$path"
        cd (dirname "$path")
        nvim (basename "$path")
    else if test -d "$path"
        cd "$path"
    end
end
