function f
    set path (fd --type f --hidden --no-ignore --color=always . $argv | fpr)

    if test -d "$path"
        cd "$path"
    else if test -f "$path"
        cd (dirname "$path")
        set filename (basename "$path")
        prompt "edit $filename?" && nvim "$filename"
    end
end
