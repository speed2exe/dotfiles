function fp
	fzf \
	--ansi --preview 'echo "show {}" | fish' $argv \
	--bind ctrl-d:preview-page-down \
	--bind ctrl-u:preview-page-up \
	--bind ctrl-j:preview-down \
	--bind ctrl-k:preview-up \
	--bind tab:down \
	--bind btab:up
end
