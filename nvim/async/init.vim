" https://vi.stackexchange.com/questions/678/how-do-i-save-a-file-in-a-directory-that-does-not-yet-exist
augroup Mkdir
    autocmd!
    autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END

" https://stackoverflow.com/questions/630884/opening-vim-help-in-a-vertical-split-window
autocmd FileType help wincmd L

source ~/.config/nvim/async/plugins.vim
