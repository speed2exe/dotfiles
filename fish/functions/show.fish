function show
    set arg_count (count $argv)

    if test $arg_count -eq 0
        ll
        return
    end

    if test $arg_count -gt 1
        error "show: expected 1 argument, got $arg_count"
        return
    end

    if test -d "$argv"
        ll $argv
        return
    end

    # handle case for file with line number
    set file_line_pair (string split --max 1 --right : "$argv")
    set file "$file_line_pair[1]"
    set line "$file_line_pair[2]"

    if test -f "$file"
        if test -z "$line"
            bat --theme=Dracula --color=always --style=numbers "$file"
            return
        end

        set from_line (math max 0, "$line" - 5)

        bat --theme=Dracula --color=always --style=numbers \
            --line-range "$from_line": \
            --highlight-line "$line:" "$file"
        return
    end

    error "neither file[ with line number] nor directory: $argv"
end
