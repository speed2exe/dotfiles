function fmt_error
    while read -l line
        set_color red
        echo "$line" >&2
        set_color normal
    end
end
