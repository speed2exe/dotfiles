function gl
    git log --pretty=format:"%C(yellow)%h%C(reset) %C(blue)%ad%C(reset)|%C(magenta)%an%C(reset)|%s" --color=always | column -t -s "|" \
        | fzf \
        --preview 'git diff --color=always $(echo {} | cut -f 1 -d " ")' \
        --preview-window 'top,50%,border-bottom' \
        --reverse --ansi \
        --bind ctrl-d:preview-page-down \
        --bind ctrl-u:preview-page-up \
        --bind ctrl-j:preview-down \
        --bind ctrl-k:preview-up \
        --bind tab:down \
        --bind btab:up \
        | cut -f 1 -d ' ' | xargs -I {} git checkout {}
end
