local vim = vim

local set = vim.keymap.set

vim.g.mapleader = ' ';

-- Remove all empty lines within a range
-- https://linuxize.com/post/vim-delete-line
set('v', '<leader>d', '<CMD>g/^$/d<CR>')

-- Auto braces after return
set('i', '{<CR>', '{<CR>}<ESC>O')
set('i', '(<CR>', '(<CR>)<ESC>O')
set('i', '[<CR>', '[<CR>]<ESC>O')
set('i', '<<CR>', '<<CR>><ESC>O')

-- Keep cursor position after copy
set('v', 'y', 'ygv<ESC>')

-- Search highlighted
set('v', '*', 'y/<C-R>"<CR>gn')
set('v', '#', 'y?<C-R>"<CR>gn')
set('v', 'n', '<ESC>ngn')
set('v', 'N', '<ESC>NNgN')

-- Auto surround
set('v', '"', 'c"<ESC>maa<C-R>""<ESC>mb`av`b')
set('v', '\'', 'c\'<ESC>maa<C-R>"\'<ESC>mb`av`b')
set('v', '`', 'c`<ESC>maa<C-R>"`<ESC>mb`av`b')
set('v', '[', 'c[<ESC>maa<C-R>"]<ESC>mb`av`b')
set('v', ']', 'c[<ESC>maa<C-R>"]<ESC>mb`av`b')
set('v', '{', 'c{<ESC>maa<C-R>"}<ESC>mb`av`b')
set('v', '}', 'c{<ESC>maa<C-R>"}<ESC>mb`av`b')
set('v', '(', 'c(<ESC>maa<C-R>")<ESC>mb`av`b')
set('v', ')', 'c(<ESC>maa<C-R>")<ESC>mb`av`b')
set('v', '<', 'c<<ESC>maa<C-R>"><ESC>mb`av`b')
set('v', '>', 'c<<ESC>maa<C-R>"><ESC>mb`av`b')

-- Remove First and Last char Surround
set('v', '<leader>"', 'c <ESC>maa<C-R>" <ESC>dT"x`adt"ci"<BS><DEL><C-R>"<ESC>v`ao')
set('v', '<leader>\'', 'c <ESC>maa<C-R>" <ESC>dT\'x`adt\'ci\'<BS><DEL><C-R>"<ESC>v`ao')
set('v', '<leader>`', 'c <ESC>maa<C-R>" <ESC>dT`x`adt`ci`<BS><DEL><C-R>"<ESC>v`ao')
set('v', '<leader>[', 'c <ESC>maa<C-R>" <ESC>dT]x`adt[ci[<BS><DEL><C-R>"<ESC>v`ao')
set('v', '<leader>]', 'c <ESC>maa<C-R>" <ESC>dT]x`adt[ci[<BS><DEL><C-R>"<ESC>v`ao')
set('v', '<leader>{', 'c <ESC>maa<C-R>" <ESC>dT}x`adt{ci{<BS><DEL><C-R>"<ESC>v`ao')
set('v', '<leader>}', 'c <ESC>maa<C-R>" <ESC>dT}x`adt{ci{<BS><DEL><C-R>"<ESC>v`ao')
set('v', '<leader>(', 'c <ESC>maa<C-R>" <ESC>dT)x`adt(ci(<BS><DEL><C-R>"<ESC>v`ao')
set('v', '<leader>)', 'c <ESC>maa<C-R>" <ESC>dT)x`adt(ci(<BS><DEL><C-R>"<ESC>v`ao')
set('v', '<leader><', 'c <ESC>maa<C-R>" <ESC>dT>x`adt<ci<<BS><DEL><C-R>"<ESC>v`ao')
set('v', '<leader>>', 'c <ESC>maa<C-R>" <ESC>dT>x`adt<ci<<BS><DEL><C-R>"<ESC>v`ao')

-- quick macro (after qq)
set('n', 'Q', '@q')
set('v', 'Q', '<CMD>\'<,\'>normal @q<CR>')

-- quick mark (after mm)
set('n', 'M', '`m')

-- quick quit window
set('n', '<C-Q>', '<CMD>q!<CR>')
set('i', '<C-Q>', '<CMD>q!<CR>')

-- quick fold
set('v', '<leader>z', ':fold<CR>')

-- highlight after paste
set('n', 'vp', '`[v`]')

-- https://vim.fandom.com/wiki/Map_Ctrl-Backspace_to_delete_previous_word
set('i', '<C-BS>', '<C-W>')
set('i', '<C-H>', '<C-W>')
set('c', '<C-BS>', '<C-W>')
set('c', '<C-H>', '<C-W>')

-- Search and replace for visually selected on entire document template
set('v', '<leader>S', 'y:%s/<C-R>"/<C-R>"')

-- Search and replace for clipboard content on visually selected
set('v', '<leader>s', ':s/<C-R>"/<C-R>"')

-- Copy
set('v', '<C-C>', 'y')

-- Paste
set('i', '<C-V>', '<C-R>*')

-- create file with filename under cursor if not exists
-- and edit the file
set('n', '<leader>e', ':e <cfile><CR>')
-- go to file with line if any
set('n', '<leader>f', 'gF')

-- Move next line up
set('n', 'J', 'mzJ`z')

-- print current file
set('n', '<ESC>', '<CMD>echo expand("%:p")<CR>')
-- copy current file path to clipboard
set('n', 'yf', '<CMD>let @+ = expand("%:p")<CR>')
-- hightlight entire file
set('n', 'v%', 'gg^vG$')
set('n', 'y%', '<CMD>:%y+<CR>')
-- copy current file path and line number to ~/marks/files.txt
set('n', '<leader>m', '<CMD>redir @m<CR><CMD>echo expand(\'%:p\') . \':\' . line(".")<CR><CMD>redir END<CR>:!m<C-R>m<CR><CR>')
-- quick access to marked files
set('n', '<leader>g', '<CMD>e ~/marks/files.txt<CR>')

-- Move lines up and down
set('v', '<C-J>', ':m \'>+1<CR>gv')
set('v', '<C-K>', ':m \'<-2<CR>gv')
set('n', '<C-J>', ':m .+1<CR>')
set('n', '<C-K>', ':m .-2<CR>')
set('i', '<C-J>', '<ESC>:m .+1<CR>a')
set('i', '<C-K>', '<ESC>:m .-2<CR>a')

-- toggle search highlight
set('n', '<expr>', '<leader>h (&hls && v:hlsearch ? \':set nohlsearch\' : \':set hlsearch\')."\n"')

-- Indent
set('v', ',', '<gv')
set('v', '.', '>gv')
set('n', '<<', '<<^')
set('n', '>>', '>>$')
set('i', '<C-N>', '<ESC><<I')
set('i', '<C-T>', '<ESC>>>A')
set('n', '<leader>i', 'jgg=G<C-O>k')

-- repeat last command
set('n', ',', '@:')

-- toggle jump back and forth
set('n', '<PAGEUP>', '<C-O>')
set('n', '<PAGEDOWN>', '<C-I>')

-- go to prev directory
set('n', '<DEL>', ':cd ..<CR>:pwd<CR>')
-- go to project root
set('n', '<HOME>', ':ProjectRoot<CR>:pwd<CR>')
-- go to current file directory
set('n', '<END>', ':lcd %:p:h<CR>:pwd<CR>')

-- new window
set('n', '<leader>x', '<CMD>split<CR>')
set('n', '<leader>X', '<CMD>new<CR>')
set('n', '<leader>v', '<CMD>vsplit<CR>')
set('n', '<leader>V', '<CMD>vnew<CR>')

-- move between windows
set('n', '<LEFT>', '<C-W>h')
set('n', '<DOWN>', '<C-W>j')
set('n', '<UP>', '<C-W>k')
set('n', '<RIGHT>', '<C-W>l')

-- windows layout
set('n', '<S-LEFT>', '<C-W>H')
set('n', '<S-DOWN>', '<C-W>J')
set('n', '<S-UP>', '<C-W>K')
set('n', '<S-RIGHT>', '<C-W>L')

-- resize windows
set('n', '+', '<CMD>vertical resize +10<CR>')
set('n', '-', '<CMD>vertical resize -10<CR>')
set('n', '|', '<CMD>resize +10<CR>')
set('n', '_', '<CMD>resize -10<CR>')

-- Quick fix list
-- Add location list here if i ever use it
set('n', '{', '<CMD>cprev<CR>')
set('n', '}', '<CMD>cnext<CR>')
set('n', '<leader>q', '<CMD>lua require(\'function\').toggle_quick_fix_list()<CR>')

-- Telescope
set('n', '<leader>t', '<CMD>Telescope<CR>')
set('n', '<leader>tg', '<CMD>Telescope grep_string<CR>')
set('n', '<leader>tj', '<CMD>Telescope jumplist<CR>')
set('n', '<leader>tk', '<CMD>Telescope keymaps<CR>')
set('n', '<leader>td', '<CMD>Telescope diagnostics<CR>')
set('n', '<leader>ta', '<CMD>Telescope lsp_document_symbols<CR>')
set('n', '<leader>te', '<CMD>Telescope lsp_dynamic_workspace_symbols<CR>')
-- find files, find buffer and find text
set('n', '<TAB>', '<CMD>Telescope buffers<CR>')
set('n', '<S-TAB>', '<CMD>Telescope find_files<CR>')
set('n', '<BS>', '<CMD>Telescope live_grep<CR>')

-- NvimTree
set('n', '<leader>n', '<CMD>NvimTreeToggle<CR>')

-- debug adapter protocol
-- nnoremap <leader>db <CMD>lua require('dap').toggle_breakpoint()<CR>
-- nnoremap <leader>de <CMD>lua require('dap').set_exception_breakpoints()<CR>
-- nnoremap <leader>dl <CMD>lua require('dap').list_breakpoints()<CR>
-- nnoremap <leader>dr <CMD>lua require('dap').run_last()<CR>
-- nnoremap <leader>da <CMD>lua require('dap').step_over()<CR>
-- nnoremap <leader>di <CMD>lua require('dap').step_into()<CR>
-- nnoremap <leader>do <CMD>lua require('dap').step_out()<CR>
-- nnoremap <leader>dt <CMD>lua require('dap').terminate()<CR>
-- nnoremap <leader>d<SPACE> <CMD>lua require('dap').run_to_cursor()<CR>
-- nnoremap <leader>d<CR> <CMD>lua require('dap').continue()<CR>
-- nnoremap <leader>d<TAB> <CMD>lua require('dap').repl.toggle()<CR>

-- terminal access
set('n', '<leader><leader>', 'o<ESC>:.!')
set('v', '<leader><leader>', 'c<CR><CR><UP><ESC>:.!<C-R>"<CR>k')

-- Syntax Tree Navigation
-- from normal mode
set('n', 'v<BS>', '<CMD>STSSelectCurrentNode<CR>')

-- in visual mode
set('v', '<TAB>', '<CMD>STSSelectNextSiblingNode<CR>')
set('v', '<S-TAB>', '<CMD>STSSelectPrevSiblingNode<CR>')
set('v', '<BS>', '<CMD>STSSelectParentNode<CR>')
set('v', '<CR>', '<CMD>STSSelectChildNode<CR>')
-- swap in visual mode
set('v', 'J', '<CMD>STSSwapNextVisual<CR>')
set('v', 'K', '<CMD>STSSwapPrevVisual<CR>')

-- Symbols Outline
set('n', '<leader>o', '<CMD>SymbolsOutline<CR>')

-- Toggle lsp lines diagnostics
set('n', '<leader>a', '<CMD>lua require(\'lsp_lines_conf\').toggle_inline_text()<CR>')

-- Custom Personal Mapping
set('n', 'gn', '<CMD>lua vim.lsp.buf.rename()<CR>')
set('n', 'gf', '<CMD>lua vim.lsp.buf.formatting()<CR>')
set('n', 'gd', '<CMD>lua vim.lsp.buf.definition()<CR>')
set('n', 'gi', '<CMD>lua vim.lsp.buf.implementation()<CR>')
set('n', 'gr', '<CMD>lua vim.lsp.buf.references()<CR>')
set('n', 'gh', '<CMD>lua vim.lsp.buf.hover()<CR>')
set('n', 'ga', '<CMD>lua vim.lsp.buf.code_action()<CR>')
set('n', 'gt', '<CMD>lua vim.lsp.buf.type_definition()<CR>')
-- TODO: add more if needed, shouldn't need more

-- Github copilot stuff
vim.g.copilot_no_tab_map = true
