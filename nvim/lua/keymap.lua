local vim = vim
local set = vim.keymap.set
local fn = require 'function'
local lsp_lines_conf = require 'lsp_lines_conf'
local autosave = require 'auto-save'
local nvim_tree = require 'nvim-tree'

vim.g.mapleader = ' ';

-- Remove all empty lines within a range
-- https://linuxize.com/post/vim-delete-line
set('v', '<leader>d', '<CMD>\'<,\'>g/^$/d<CR>')

-- Auto braces after return
set('i', '{<CR>', '{<CR>}<ESC>O')
set('i', '(<CR>', '(<CR>)<ESC>O')
set('i', '[<CR>', '[<CR>]<ESC>O')
set('i', '<<CR>', '<<CR>><ESC>O')

-- Keep cursor position after copy
set('v', 'y', 'ygv<ESC>')

-- Don't select the new line
set('v', '$', '$h')

-- Search highlighted
set('v', '*', 'y/<C-R>"<CR>gn')
set('v', '#', 'y?<C-R>"<CR>gn')
set('v', 'n', '<ESC>ngn')
set('v', 'N', '<ESC>NNgN')

-- Auto surround
set('v', '""', 'c"<ESC>maa<C-R>""<ESC>mb`av`b')
set('v', '\'\'', 'c\'<ESC>maa<C-R>"\'<ESC>mb`av`b')
set('v', '``', 'c`<ESC>maa<C-R>"`<ESC>mb`av`b')
set('v', '[]', 'c[<ESC>maa<C-R>"]<ESC>mb`av`b')
set('v', '{}', 'c{<ESC>maa<C-R>"}<ESC>mb`av`b')
set('v', '()', 'c(<ESC>maa<C-R>")<ESC>mb`av`b')
set('v', '<>', 'c<<ESC>maa<C-R>"><ESC>mb`av`b')

-- Remove First and Last char Surround
set('v', '"<BS>', 'c <ESC>maa<C-R>" <ESC>dT"x`adt"ci"<BS><DEL><C-R>"<ESC>v`ao')
set('v', '\'<BS>', 'c <ESC>maa<C-R>" <ESC>dT\'x`adt\'ci\'<BS><DEL><C-R>"<ESC>v`ao')
set('v', '`<BS>', 'c <ESC>maa<C-R>" <ESC>dT`x`adt`ci`<BS><DEL><C-R>"<ESC>v`ao')
set('v', '][', 'c <ESC>maa<C-R>" <ESC>dT]x`adt[ci[<BS><DEL><C-R>"<ESC>v`ao')
set('v', '}{', 'c <ESC>maa<C-R>" <ESC>dT}x`adt{ci{<BS><DEL><C-R>"<ESC>v`ao')
set('v', ')(', 'c <ESC>maa<C-R>" <ESC>dT)x`adt(ci(<BS><DEL><C-R>"<ESC>v`ao')
set('v', '><', 'c <ESC>maa<C-R>" <ESC>dT>x`adt<ci<<BS><DEL><C-R>"<ESC>v`ao')

-- quick macro (after qq)
set('n', 'Q', '@q')
set('v', 'Q', '<CMD>\'<,\'>normal @q<CR>')

-- quick mark (after mm)
set('n', 'M', '`m')

-- quick quit window
set('n', '<C-C>', '<CMD>q!<CR>')

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
-- TODO: currently not working, fix it
set('n', '<leader>m',
    '<CMD>redir @m<CR><CMD>echo expand(\'%:p\') . \':\' . line(".")<CR><CMD>redir END<CR>:!m<C-R>m<CR><CR>')
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
set('n', '<leader>h', fn.toggle_hlsearch)

-- Indent
set('v', ',', '<gv')
set('v', '.', '>gv')
set('n', '<<', '<<^')
set('n', '>>', '>>$')
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

-- Terminal
set('n', '<leader><CR>', ':edit term://fish<CR>i')
set('t', '<ESC><ESC>', '<C-\\><C-N>')

-- move between windows
set('n', '<LEFT>', '<C-W>h')
set('n', '<DOWN>', '<C-W>j')
set('n', '<UP>', '<C-W>k')
set('n', '<RIGHT>', '<C-W>l')

-- swap windows and change layout
set('n', '<S-LEFT>', '<C-W>H')
set('n', '<S-DOWN>', '<C-W>J')
set('n', '<S-UP>', '<C-W>K')
set('n', '<S-RIGHT>', '<C-W>L')

-- resize windows
set('n', '+', '<CMD>vertical resize +10<CR>')
set('n', '-', '<CMD>vertical resize -10<CR>')
set('n', '|', '<CMD>resize +10<CR>')
set('n', '_', '<CMD>resize -10<CR>')
set('n', '<C-T>', '<C-W>=')

-- Quick fix list
-- Add location list here if i ever use it
set('n', '(', '<CMD>cprev<CR>')
set('n', ')', '<CMD>cnext<CR>')
set('n', '<C-Q>', fn.toggle_quick_fix_list)

-- Telescope
set('n', '<leader>t', '<CMD>Telescope<CR>')
set('n', '<leader>tg', '<CMD>Telescope grep_string<CR>')
set('n', '<leader>tj', '<CMD>Telescope jumplist<CR>')
set('n', '<leader>tk', '<CMD>Telescope keymaps<CR>')
set('n', '<leader>th', '<CMD>Telescope help_tags<CR>')
set('n', '<leader>td', '<CMD>Telescope diagnostics<CR>')
set('n', '<leader>ta', '<CMD>Telescope lsp_document_symbols<CR>')
set('n', '<leader>te', '<CMD>Telescope lsp_dynamic_workspace_symbols<CR>')
-- Non conforming Telescope keymap to the rest of the keybindings
set('n', '<leader>q', '<CMD>Telescope quickfix<CR>')
set('n', '<TAB>', '<CMD>Telescope oldfiles<CR>')
set('n', '<BS>', '<CMD>Telescope find_files<CR>')
set('n', '<leader><leader>', '<CMD>Telescope live_grep<CR>')
set('n', '<S-TAB>', '<CMD>Telescope file_browser<CR>')

-- NvimTree
-- set('n', '<leader><TAB>', '<CMD>NvimTreeFindFileToggle<CR>')
-- set('n', '<TAB>', nvim_tree.open_replacing_current_buffer)

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

-- command line execution
set('n', '!', 'o<ESC>:.!')
set('v', '!', 'c<CR><CR><UP><ESC>:.!<C-R>"<CR>k')

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
set('n', '<leader>a', lsp_lines_conf.toggle_inline_text)

-- Toggle auto-save
set('n', '<C-S>', autosave.toggle)

-- Custom Personal Mapping
-- Add more if needed, but shouldn't need more
set('n', 'gn', vim.lsp.buf.rename)
set('n', 'gf', vim.lsp.buf.formatting)
set('n', 'gd', vim.lsp.buf.definition)
set('n', 'gi', vim.lsp.buf.implementation)
set('n', 'gr', vim.lsp.buf.references)
set('n', 'gh', vim.lsp.buf.hover)
set('n', 'ga', vim.lsp.buf.code_action)
set('n', 'gt', vim.lsp.buf.type_definition)
