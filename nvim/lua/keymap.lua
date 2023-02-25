local vim = vim
local set = vim.keymap.set
local fn = require 'function'
local t_builtin = require 'telescope.builtin'
local file_browser = require 'telescope'.extensions.file_browser.file_browser
local baleia = require('baleia')

vim.g.mapleader = ' ';

-- Interpret ansi colors
set('n', '<leader>c', function()
    baleia.setup().once(vim.fn.bufnr())
end)

-- create file if not exists
set('n', '<leader>e', ':e <cfile><CR>')

-- Remove lines with only whitespace or nothing
set('v', '<leader><BS>', ':g/^\\s*$/d<CR>')

-- Apply macro to all lines to visual selection
set('v', 'q', ':normal @q<CR>')

-- higlight yanked text, or just edited text
set('n', 'vv', '`[v`]')

-- Search and replace for clipboard content on visually selected
set('v', '<leader>s', ':s/<C-R>"/<C-R>"')

-- copy current file path to clipboard
set('n', 'yf', '<CMD>let @+ = expand("%:p")<CR>')
-- yank current file content to clipboard
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

-- toggle quickfix window
set('n', '<C-Q>', fn.toggle_quick_fix_list)
set('n', '<C-[>', '<CMD>cprev<CR>')
set('n', '<C-]>', '<CMD>cnext<CR>')

-- Indent
set('v', ',', '<gv')
set('v', '.', '>gv')

-- go to project root
set('n', '<leader><ESC>', '<CMD>ProjectRoot<CR>')
-- go to current file directory
set('n', '<ESC>', '<CMD>lcd %:p:h<CR>')

-- Telescope
set('n', '<leader>t', '<CMD>Telescope<CR>')
set('n', '<leader>rs', t_builtin.resume)
set('n', '<leader>ht', t_builtin.help_tags)
set('n', '<leader>dn', t_builtin.diagnostics)
set('n', '<leader>k', t_builtin.keymaps)
set('n', '<leader>j', t_builtin.jumplist)
set('n', '<leader>q', t_builtin.quickfix)
set('n', '<leader>rg', t_builtin.registers)
set('n', '<leader>m', t_builtin.marks)
set('n', '<leader>f', t_builtin.find_files)
set('n', '<leader>g', t_builtin.git_files)
set('n', '<leader>s', t_builtin.live_grep)
set('n', '<leader>l', t_builtin.lsp_dynamic_workspace_symbols)
set('n', '<leader>o', t_builtin.oldfiles)
set('n', '<leader>b', t_builtin.buffers)
set('n', '<leader><CR>', file_browser)

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

-- Toggle indent-blankline to show tabs
set('n', '<C-B>', ':IndentBlanklineToggle<CR>')

-- Custom Personal Mapping
-- Add more if needed, but shouldn't need more
set('n', '<leader>rn', vim.lsp.buf.rename)
set('n', '<leader>df', vim.lsp.buf.definition)
set('n', '<leader>i', vim.lsp.buf.implementation)
set('n', '<leader>rf', vim.lsp.buf.references)
set('n', '<leader>hv', vim.lsp.buf.hover)
set('n', '<leader>a', vim.lsp.buf.code_action)
set('n', '<leader>dt', vim.lsp.buf.type_definition)

-- show diagnostics
set('n', '<leader>do', vim.diagnostic.open_float)
