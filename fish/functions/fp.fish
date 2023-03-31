function fp
    fzf \
        --ansi \
        --tabstop 4 \
        --layout reverse \
        --preview-window 'top,50%,border-bottom' \
        --preview 'fish -c "show {}"' $argv \
        --bind tab:down \
        --bind btab:up \
        --bind ctrl-d:preview-half-page-down \
        --bind ctrl-u:preview-half-page-up \
        --bind ctrl-j:preview-down \
        --bind ctrl-k:preview-up \
        -i $argv
end
