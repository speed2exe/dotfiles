local vim = vim
local set = vim.keymap.set
local fn = require 'function'
local lsp_lines_conf = require 'lsp_lines_conf'
local t_builtin = require 'telescope.builtin'
local baleia = require('baleia')

vim.g.mapleader = ' ';

-- Interpret ansi colors
set('n', '<leader>c', function()
    baleia.setup().once(0)
end)

-- :h gf => create file if not exists
set('n', 'gf', ':e <cfile><CR>')

-- Remove lines with only whitespace or nothing
set('v', '<leader><BS>', ':g/^\\s*$/d<CR>')

-- Apply macro to all lines to visual selection
set('v', '<leader>q', ':normal @q<CR>')

-- higlight yanked text, or just edited text
set('n', 'vv', '`[v`]')

-- Search and replace for visually selected on entire document template
set('v', '<leader>S', 'y:%s/<C-R>"/<C-R>"')

-- Search and replace for clipboard content on visually selected
set('v', '<leader>s', ':s/<C-R>"/<C-R>"')

-- print current directory
set('n', '<ESC>', '<CMD>pwd<CR>')
-- copy current file path to clipboard
set('n', 'yf', '<CMD>let @+ = expand("%:p")<CR>')
-- highlight entire file
set('n', 'v%', 'gg^vG$')
set('n', 'y%', '<CMD>:%y+<CR>')

-- Move lines up and down
set('v', '<C-J>', ':m \'>+1<CR>gv')
set('v', '<C-K>', ':m \'<-2<CR>gv')
set('n', '<C-J>', ':m .+1<CR>')
set('n', '<C-K>', ':m .-2<CR>')
set('i', '<C-J>', '<ESC>:m .+1<CR>a')
set('i', '<C-K>', '<ESC>:m .-2<CR>a')

-- toggle search highlight
set('n', '<C-H>', fn.toggle_hlsearch)

-- Indent
set('v', ',', '<gv')
set('v', '.', '>gv')

-- go to prev directory
set('n', '<DEL>', ':cd ..<CR>:pwd<CR>')
-- go to project root
set('n', '<HOME>', ':ProjectRoot<CR>:pwd<CR>')
-- go to current file directory
set('n', '<END>', ':lcd %:p:h<CR>:pwd<CR>')

-- new window
set('n', '<leader>x', '<CMD>split<CR>')
set('n', '<leader>v', '<CMD>vsplit<CR>')
set('n', '<leader>n', '<CMD>enew<CR>')

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
set('n', '=', '<CMD>resize +10<CR>')
set('n', '_', '<CMD>resize -10<CR>')
set('n', '\\', '<C-W>=')

-- Quick fix list
-- Add location list here if i ever use it
set('n', '(', '<CMD>cprev<CR>')
set('n', ')', '<CMD>cnext<CR>')
set('n', '<C-Q>', fn.toggle_quick_fix_list)

-- Telescope
set('n', '<leader>t', '<CMD>Telescope<CR>')
set('n', '<leader><ESC>', t_builtin.resume)
set('n', '<leader>h', t_builtin.help_tags)
set('n', '<leader>l', t_builtin.lsp_dynamic_workspace_symbols)
set('n', '<leader>d', t_builtin.diagnostics)
set('n', '<leader>k', t_builtin.keymaps)
set('n', '<leader>j', t_builtin.jumplist)
set('n', '<leader>q', t_builtin.quickfix)
set('n', '<leader>r', t_builtin.registers)
set('n', '<leader>m', t_builtin.marks)
set('n', '<leader>f', t_builtin.find_files)
set('n', '<leader>g', t_builtin.git_files)
set('n', '<leader>s', t_builtin.live_grep)
set('n', '<leader>o', t_builtin.oldfiles)
set('n', '<leader>b', t_builtin.buffers)

-- Quick Comment
set('n', '<BS>', '<Plug>(comment_toggle_linewise_current)j')
set('v', '<BS>', '<Plug>(comment_toggle_blockwise_visual)gv')

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

-- Symbols Outline
set('n', '<C-S>', '<CMD>SymbolsOutline<CR>')

-- Toggle lsp lines diagnostics
set('n', '<C-L>', lsp_lines_conf.toggle_inline_text)

-- Custom Personal Mapping
-- Add more if needed, but shouldn't need more
set('n', 'gn', vim.lsp.buf.rename)
set('n', 'gl', vim.lsp.buf.format)
set('n', 'gd', vim.lsp.buf.definition)
set('n', 'gi', vim.lsp.buf.implementation)
set('n', 'gr', vim.lsp.buf.references)
set('n', 'gh', vim.lsp.buf.hover)
set('n', 'ga', vim.lsp.buf.code_action)
set('n', 'gt', vim.lsp.buf.type_definition)
