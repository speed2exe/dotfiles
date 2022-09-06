function gl
    git log --oneline --color=always \
        | fzf \
        --preview 'git diff --color=always $(echo {} | cut -f 1 -d " ")' \
        --reverse --height 50% --ansi \
        --bind ctrl-d:preview-page-down \
        --bind ctrl-u:preview-page-up \
        --bind ctrl-j:preview-down \
        --bind ctrl-k:preview-up \
        --bind tab:down \
        --bind btab:up \
        | cut -f 1 -d ' ' | xargs -I {} git checkout {}
end
