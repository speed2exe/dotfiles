function fp
	fzf \
        --ansi \
        --tabstop 4 \
        --layout reverse \
        --preview 'fish -c "show {}"' $argv \
        --preview-window 'top,50%,border-bottom' \
        --bind ctrl-d:preview-page-down \
        --bind ctrl-u:preview-page-up \
        --bind ctrl-j:preview-down \
        --bind ctrl-k:preview-up \
        --bind tab:down \
        --bind btab:up \
    $argv
end
