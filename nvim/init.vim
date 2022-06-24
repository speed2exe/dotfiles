source ~/.config/nvim/plugins.vim
source ~/.config/nvim/setttings.vim
source ~/.config/nvim/remap.vim

" https://www.reddit.com/r/vim/comments/jcecyb/vims_background_turns_opaque_in_new_windows/
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE " transparent bg

function! LoadAsync() abort
    call timer_start(1000, function('LoadAsyncTimerid'))
endfunction

function! LoadAsyncTimerid(timerid) abort
    source ~/.config/nvim/init_async.vim
endfunction

call LoadAsync()
