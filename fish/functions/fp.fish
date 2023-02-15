function fp
	fzf \
        --ansi \
        --tabstop 4 \
        --layout reverse \
        --preview-window 'top,50%,border-bottom' \
        --preview 'fish -c "show {}"' $argv \
        --bind 'tab:change-preview-window(right,50%,border-left|top,50%,border-bottom)' \
        --bind ctrl-d:preview-page-down \
        --bind ctrl-u:preview-page-up \
        --bind ctrl-j:preview-down \
        --bind ctrl-k:preview-up \
    $argv
end
