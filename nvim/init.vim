source ~/.config/nvim/plugins.vim
" source ~/.config/nvim/setttings.vim
" source ~/.config/nvim/remap.vim
" source ~/.config/nvim/neovide.vim

" https://www.reddit.com/r/vim/comments/jcecyb/vims_background_turns_opaque_in_new_windows/
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE " transparent bg

" https://vi.stackexchange.com/questions/678/how-do-i-save-a-file-in-a-directory-that-does-not-yet-exist
augroup Mkdir
    autocmd!
    autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END

" https://stackoverflow.com/questions/630884/opening-vim-help-in-a-vertical-split-window
autocmd FileType help wincmd L

" Comments in italic
highlight Comment cterm=italic gui=italic

" in process of migration to lua files
lua << EOF
    require('keymap')
    require('settings')
EOF

" TODO: map key to function in lua
