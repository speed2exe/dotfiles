let mapleader = " "

" Remove all empty lines within a range
" https://linuxize.com/post/vim-delete-line
vnoremap <leader>d :g/^\s*$/d<CR>

" Show Cursor
" nnoremap <ESC> <CMD>set cursorline!<Bar>set cursorcolumn!<CR>

" Auto braces after return
inoremap {<CR> {<CR>}<ESC>O
inoremap (<CR> (<CR>)<ESC>O
inoremap [<CR> [<CR>]<ESC>O
inoremap <<CR> <<CR>><ESC>O
" Prevent action from cancelled when back to normal mode
inoremap {<ESC> {<ESC>
inoremap (<ESC> (<ESC>
inoremap [<ESC> [<ESC>
inoremap <<ESC> <<ESC>

" Search highlighted
vnoremap * y/<C-R>"<CR>gn
vnoremap # y?<C-R>"<CR>gn
vnoremap n <ESC>ngn
vnoremap N <ESC>NNgN

" Auto surround
vnoremap " c"<ESC>maa<C-R>""<ESC>mb`av`b
vnoremap ' c'<ESC>maa<C-R>"'<ESC>mb`av`b
vnoremap ` c`<ESC>maa<C-R>"`<ESC>mb`av`b
vnoremap [ c[<ESC>maa<C-R>"]<ESC>mb`av`b
vnoremap { c{<ESC>maa<C-R>"}<ESC>mb`av`b
vnoremap ( c(<ESC>maa<C-R>")<ESC>mb`av`b
vnoremap < c<<ESC>maa<C-R>"><ESC>mb`av`b

" quick macro (after qq)
nnoremap Q @q

" quick mark (after mm)
nnoremap M `m

" quick quit
nnoremap <C-Q> <CMD>q!<CR>
inoremap <C-Q> <CMD>q!<CR>

" quick write
nnoremap <C-W> <CMD>wa<CR>
inoremap <C-W> <CMD>wa<CR>

" quick fold
vnoremap <leader>z :fold<CR>

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
" otherwise edit the file
nnoremap gf :e <cfile><CR>

" Move next line up
nnoremap J mzJ`z

" Move to end of sentence
nnoremap ( k{<SPACE>^
nnoremap ) j}<BS>$

" copy current file path to clipboard
nnoremap <leader>c <CMD>let @+ = expand("%:p")<CR>
" copy current file path and line number to ~/marks/files.txt
nnoremap <leader>m <CMD>redir @m<CR><CMD>echo expand('%:p') . ':' . line(".")<CR><CMD>redir END<CR>:!m<C-R>m<CR><CR>
" quick access to marked files
nnoremap <leader>g <CMD>e ~/marks/files.txt<CR>

" Copy and Paste
vnoremap <leader>c :w! /tmp/.clipboard<CR>
nnoremap <leader>p :r /tmp/.clipboard<CR>

" Move lines up and down
vnoremap <C-J> :m '>+1<CR>gv
vnoremap <C-K> :m '<-2<CR>gv
nnoremap <C-J> :m .+1<CR>
nnoremap <C-K> :m .-2<CR>
inoremap <C-J> <ESC>:m .+1<CR>a
inoremap <C-K> <ESC>:m .-2<CR>a

" toggle search highlight
nnoremap <expr> <leader>h (&hls && v:hlsearch ? ':set nohlsearch' : ':set hlsearch')."\n"

" Indent
vnoremap , <gv
vnoremap . >gv
nnoremap < <<^
nnoremap > >>$
inoremap <C-N> <ESC><<I
inoremap <C-T> <ESC>>>A
nnoremap <leader>i jgg=G<C-O>k

" repeat last command
nnoremap , @:

" toggle jump back and forth
nnoremap <PAGEUP> <C-O>
nnoremap <PAGEDOWN> <C-I>

" Back 1 Directory
nnoremap <DEL> <CMD>cd ..<CR>
" To project root
nnoremap <HOME> <CMD>ProjectRoot<CR>
" Current File Directory
nnoremap <END> <CMD>lcd %:p:h<CR>

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

" Quick fix list
" " Global List
nnoremap [ <CMD>cprev<CR>
nnoremap ] <CMD>cnext<CR>
" " Local List
nnoremap { <CMD>lprev<CR>
nnoremap } <CMD>lnext<CR>

" Telescope
nnoremap <leader>t :Telescope 
nnoremap <leader>tl <CMD>Telescope live_grep<CR>
nnoremap <leader>tg <CMD>Telescope grep_string<CR>
nnoremap <leader>tj <CMD>Telescope jumplist<CR>
vnoremap <leader>te <CMD>Telescope diagnostics<CR>
nnoremap <leader>tr <CMD>Telescope lsp_references<CR>
nnoremap <leader>td <CMD>Telescope lsp_definitions<CR>
nnoremap <leader>ti <CMD>Telescope lsp_implementations<CR>
nnoremap <leader>tt <CMD>Telescope lsp_type_definitions<CR>
nnoremap <leader>ts <CMD>Telescope lsp_document_symbols<CR>
nnoremap <leader>tw <CMD>Telescope lsp_dynamic_workspace_symbols<CR>
nnoremap <TAB> <CMD>Telescope buffers<CR>
nnoremap <leader><TAB> <CMD>Telescope find_files<CR>

" NvimTree
nnoremap <leader>n <CMD>NvimTreeToggle<CR>

" Lspsaga
nnoremap <leader>sf <CMD>lua require'lspsaga.finder'.lsp_finder()<CR>
nnoremap <leader>sa <CMD>lua require'lspsaga.codeaction'.code_action()<CR>
vnoremap <leader>sa <CMD>lua require'lspsaga.codeaction'.range_code_action()<CR>
nnoremap <leader>sh <CMD>lua require'lspsaga.hover'.render_hover_doc()<CR>
nnoremap <leader>ss <CMD>lua require'lspsaga.signaturehelp'.signature_help()<CR>
nnoremap <leader>sr <CMD>lua require'lspsaga.rename'.lsp_rename()<CR>
nnoremap <leader>sd <CMD>lua require'lspsaga.definition'.preview_definition()<CR>
nnoremap <leader>sl <CMD>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
nnoremap <leader>sk <CMD>lua require'lspsaga.diagnostic'.goto_prev()<CR>
nnoremap <leader>sj <CMD>lua require'lspsaga.diagnostic'.goto_next()<CR>
" nnoremap <leader>sd <CMD>lua require'lspsaga.action'.smart_scroll_with_saga(1)<CR>
" nnoremap <leader>su <CMD>lua require'lspsaga.action'.smart_scroll_with_saga(-1)<CR>

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

" terminal access
nnoremap <leader><leader> o<ESC>:.!
vnoremap <leader><leader> c<CR><CR><UP><ESC>:.!<C-R>"<CR>k

" lsp trouble
nnoremap <leader>a <CMD>TroubleToggle<CR>

" Syntax Tree Navigation
" from normal mode
nnoremap v<BS> <CMD>STSSelectCurrentNode<CR>

" in visual mode
vnoremap <TAB> <CMD>STSSelectNextSiblingNode<CR>
vnoremap <S-TAB> <CMD>STSSelectPrevSiblingNode<CR>
vnoremap <BS> <CMD>STSSelectParentNode<CR>
vnoremap <CR> <CMD>STSSelectChildNode<CR>
" swap in visual mode
vnoremap J <CMD>STSSwapNextVisual<CR>
vnoremap K <CMD>STSSwapPrevVisual<CR>

" Symbols Outline
nnoremap <leader>o <CMD>SymbolsOutline<CR>

" Comment
nnoremap <BS> <CMD>lua require('Comment.api').toggle_current_linewise()<CR>j
vnoremap <leader><BS> <ESC>gv<CMD>lua require('Comment.api').toggle_blockwise_op(vim.fn.visualmode())<CR>

" from quick custom module
nnoremap <leader>qv <CMD>lua require('quick').toggle_virtual_text()<CR>
