let mapleader = " "

" Show Cursor
nnoremap <ESC> <CMD>Beacon<CR>

" quick macro (after qq)
nnoremap Q @q

" quick quit
nnoremap <C-Q> <CMD>q!<CR>
inoremap <C-Q> <CMD>q!<CR>

" quick write
nnoremap <C-W> <CMD>wa<CR>
inoremap <C-W> <CMD>wa<CR>

" https://vim.fandom.com/wiki/Map_Ctrl-Backspace_to_delete_previous_word
inoremap <C-BS> <C-W>
inoremap <C-H> <C-W>

" Search and replace for visually selected on entire document template
vnoremap <leader>S y:%s/<C-R>"/<C-R>"

" Search and replace for clipboard content on visually selected
vnoremap <leader>s :s/<C-R>"/<C-R>"

" Copy
vnoremap <C-C> y

" Paste
inoremap <C-V> <C-R>*

" create file with filename under cursor if not exists
nnoremap <leader>e :e <cfile><CR>

" navigate to file with line number
nnoremap <leader>f gF

" Move next line up
nnoremap J mzJ`z

" Move to end of sentence
nnoremap ( k{<SPACE>^:Beacon<CR>
nnoremap ) j}<BS>$:Beacon<CR>

" copy current file path and line number to ~/marks/files.txt
nnoremap <leader>m <CMD>redir @m<CR><CMD>echo expand('%:p') . ':' . line(".")<CR><CMD>redir END<CR>:!m<C-R>m<CR><CR>
" quick access to marked files
nnoremap <leader>g <CMD>e ~/marks/files.txt<CR>

" Copy and Paste
vnoremap <leader>c :w! ~/.clipboard<CR>
nnoremap <leader>p :r ~/.clipboard<CR>

" move blocks
vnoremap <C-J> :m '>+1<CR>gv
vnoremap <C-K> :m '<-2<CR>gv
nnoremap <C-J> :m .+1<CR>
nnoremap <C-K> :m .-2<CR>

" toggle search highlight
nnoremap <expr> <leader>h (&hls && v:hlsearch ? ':set nohlsearch' : ':set hlsearch')."\n"

" Indent
vnoremap , <gv
vnoremap . >gv
nnoremap <leader>i jgg=G<C-O>k

" repeat last command
nnoremap , @:

" toggle jump back and forth
nnoremap <PAGEUP> <C-O>:Beacon<CR>
nnoremap <PAGEDOWN> <C-I>:Beacon<CR>

" To project root
nnoremap < <CMD>ProjectRoot<CR>
" Current File Directory
nnoremap > <CMD>lcd %:p:h<CR>

" new windows
nnoremap <leader>x <CMD>split<CR>
nnoremap <leader>X <CMD>new<CR>
nnoremap <leader>v <CMD>vsplit<CR>
nnoremap <leader>V <CMD>vnew<CR>

" move between windows
nnoremap <LEFT> <C-W>h
nnoremap <DOWN> <C-W>j
nnoremap <UP> <C-W>k
nnoremap <RIGHT> <C-W>l

" windows layout
nnoremap <S-LEFT> <C-W>H
nnoremap <S-DOWN> <C-W>J
nnoremap <S-UP> <C-W>K
nnoremap <S-RIGHT> <C-W>L

" resize windows
nnoremap + <CMD>vertical resize +10<CR>
nnoremap - <CMD>vertical resize -10<CR>
nnoremap \| <CMD>resize +10<CR>
nnoremap _ <CMD>resize -10<CR>

" search visually selected text
vnoremap / y/\V<C-R>=escape(@",'/\')<CR><CR>

" Quick fix list
" " Global List
nnoremap [[ <CMD>cprev<CR>:Beacon<CR>
nnoremap ]] <CMD>cnext<CR>:Beacon<CR>
" " Local List
nnoremap {{ <CMD>lprev<CR>:Beacon<CR>
nnoremap }} <CMD>lnext<CR>:Beacon<CR>

" Startify
nnoremap <leader><ESC> <CMD>Startify<CR>

" Telescope
nnoremap <leader>t :Telescope 
nnoremap <leader>tf <CMD>Telescope find_files<CR>
nnoremap <leader>tl <CMD>Telescope live_grep<CR>
nnoremap <leader>tg <CMD>Telescope grep_string<CR>
nnoremap <leader>tj <CMD>Telescope jumplist<CR>
nnoremap <leader>tb <CMD>Telescope buffers<CR>
nnoremap <leader>ta <CMD>Telescope lsp_code_actions<CR>
vnoremap <leader>ta <CMD>Telescope lsp_range_code_actions<CR>
vnoremap <leader>to <CMD>Telescope lsp_document_diagnostics<CR>
vnoremap <leader>tw <CMD>Telescope lsp_workspace_diagnostics<CR>
nnoremap <leader>tt <CMD>Telescope lsp_type_definitions<CR>
nnoremap <leader>td <CMD>Telescope lsp_definitions<CR>:Beacon<CR>
nnoremap <leader>ti <CMD>Telescope lsp_implementations<CR>
nnoremap <leader>tr <CMD>Telescope lsp_references<CR>

" NvimTree
nnoremap <leader>n :nvimtree
nnoremap <leader>nt <CMD>NvimTreeToggle<CR>
nnoremap <leader>nf <CMD>NvimTreeFindFile<CR>
nnoremap <leader>nc <CMD>NvimTreeClose<CR>
nnoremap <leader>nr <CMD>NvimTreeRefresh<CR>

" Lspsaga
nnoremap <leader>s :Lspsaga 
nnoremap <leader>sd <CMD>Lspsaga preview_definition<CR>
nnoremap <leader>sf <CMD>Lspsaga lsp_finder<CR>
nnoremap <leader>sr <CMD>Lspsaga rename<CR>
nnoremap <leader>si <CMD>Lspsaga implement<CR>
nnoremap <leader>sa <CMD>Lspsaga code_action<CR>
nnoremap <leader>sh <CMD>Lspsaga hover_doc<CR>
nnoremap <leader>ss <CMD>Lspsaga signature_help<CR>
nnoremap <leader>sj <CMD>Lspsaga diagnostic_jump_next<CR>
nnoremap <leader>sk <CMD>Lspsaga diagnostic_jump_prev<CR>

" barbar.nvim
nnoremap <S-TAB> <CMD>BufferPrevious<CR>
nnoremap <TAB> <CMD>BufferNext<CR>
nnoremap <C-LEFT> <CMD>BufferMovePrevious<CR>
nnoremap <C-RIGHT> <CMD>BufferMoveNext<CR>
nnoremap <leader><TAB> <CMD>BufferPick<CR>
nnoremap <leader>b :Buffer
nnoremap <leader>bp <CMD>BufferPin<CR>
nnoremap <leader>bc <CMD>BufferClose<CR>

" debug adapter protocol
nnoremap <leader>db <CMD>lua require('dap').toggle_breakpoint()<CR>
nnoremap <leader>de <CMD>lua require('dap').set_exception_breakpoints()<CR>
nnoremap <leader>dl <CMD>lua require('dap').list_breakpoints()<CR>
nnoremap <leader>dr <CMD>lua require('dap').run_last()<CR>
nnoremap <leader>da <CMD>lua require('dap').step_over()<CR>
nnoremap <leader>di <CMD>lua require('dap').step_into()<CR>
nnoremap <leader>do <CMD>lua require('dap').step_out()<CR>
nnoremap <leader>dt <CMD>lua require('dap').terminate()<CR>
nnoremap <leader>d<SPACE> <CMD>lua require('dap').run_to_cursor()<CR>
nnoremap <leader>d<CR> <CMD>lua require('dap').continue()<CR>
nnoremap <leader>d<TAB> <CMD>lua require('dap').repl.toggle()<CR>

" terminal access with https://github.com/voldikss/vim-floaterm
nnoremap <leader><CR> :!savedir<CR>:FloatermNew --autoclose=1<CR><CR>
nnoremap <leader><leader> o<ESC>:.!
vnoremap <leader><leader> c<CR><CR><UP><ESC>:.!<C-R>"<CR>k

" lsp trouble
nnoremap <leader>a :Trouble
nnoremap <leader>at <CMD>TroubleToggle<CR>
nnoremap <leader>ar <CMD>TroubleRefresh<CR>
nnoremap <leader>ac <CMD>TroubleClose<CR>
