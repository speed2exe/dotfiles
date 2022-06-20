function show
    if [ (count $argv) -eq 0 ]
        set path (fd_all --exact-depth 1 . | fpr)
        if [ $path ]
            show $path
        end
    else if [ (count $argv) -ne 1 ]
        set_color red; echo "invalid arguments: $argv"
    else if test -d $argv
        ll $argv
    else
        # handle case for file with line number
        set file (string split --max 1 --right : $argv)
        if [ (count $file) -ne 2 ]
            bat --color=always --style=numbers $argv
        else
            set line_start (math $file[2] - 5)
            if [ $line_start -lt 0 ]
                set line_start 0
            end

            bat --color=always --style=numbers --line-range $line_start: --highlight-line $file[2]: $file[1]
        end
    end
end
