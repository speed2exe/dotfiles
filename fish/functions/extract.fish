function extract
    if test ! -f $argv
        echo "extract expects a path to file"
        return 1
    end

    set path $argv
    switch $path
        case '*.tar.bz2'
            tar xvjf $path; return
        case '*.tar.gz'
            tar xvzf $path; return
        case '*.bz2'
            bunzip2 $path; return
        case '*.rar'
            rar x $path; return
        case '*.gz'
            gunzip $path; return
        case '*.tar'
            tar xvf $path; return
        case '*.tbz2'
            tar xvjf $path; return
        case '*.tgz'
            tar xvzf $path; return
        case '*.zip'
            unzip $path; return
        case '*.Z'
            uncompress $path; return
        case '*.7z'
            7z x $path; return
        case '*.zip'
            unzip $path; return
        case '*.xz'
            xz -d $path; return
        case '*'
            echo "unknown file extension for extraction"
            return 1
    end
end
