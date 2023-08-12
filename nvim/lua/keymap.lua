local vim = vim
local set = vim.keymap.set
local fn = require 'function'
local t_builtin = require 'telescope.builtin'
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

-- higlight yanked text, or just edited text
set('n', '<leader>v', '`[v`]')

-- Search and replace for clipboard content on visually selected
set('v', '<leader>s', ':s/<C-R>"/<C-R>"')

-- copy current file path to clipboard
set('n', 'yf', '<CMD>let @+ = expand("%:p")<CR>')
-- copy current file path with line number to clipboard
set('n', 'yF', '<CMD>let @+ = join([expand("%:p"), line(".")], ":")<CR>')
-- copy current file directory to clipboard
set('n', 'yd', '<CMD>let @+ = expand("%:p:h")<CR>')
-- yank current file content to clipboard
set('n', 'y%', '<CMD>:%y+<CR>')

-- toggle search highlight
set('n', '<C-H>', fn.toggle_hlsearch)

-- toggle quickfix window
set('n', '<C-Q>', fn.toggle_quick_fix_list)

-- go to project root
set('n', '<leader><ESC>', '<CMD>ProjectRoot<CR>')
-- go to current file directory
set('n', '<leader><leader>', '<CMD>lcd %:p:h<CR>')

-- Telescope
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
set('n', '<leader>s', t_builtin.live_grep) -- search
set('n', '<leader>l', t_builtin.lsp_dynamic_workspace_symbols)
set('n', '<leader>o', t_builtin.oldfiles)
set('n', '<leader>b', t_builtin.buffers)
set('n', '<leader>t', "<CMD>Telescope file_browser path=%:p:h<CR>") -- traverse

-- Quick Comment
set('n', '<BS>', '<Plug>(comment_toggle_linewise_current)j')
set('v', '<BS>', '<Plug>(comment_toggle_blockwise_visual)gv')

-- command line execution
set('n', '!', ':.!')
set('v', '!', 'c<CR><CR><UP><C-O>:.!<C-R>"<CR><ESC>`[v`]$')

-- Toggle indent-blankline to show tabs
set('n', '<C-B>', ':IndentBlanklineToggle<CR>')

-- Toggle LSP diagnostics
set('n', '<C-L>', fn.toggle_lsp_lines)

-- Custom Personal Mapping
-- Add more if needed, but shouldn't need more
set('n', '<leader>rn', vim.lsp.buf.rename)
set('n', '<leader>df', vim.lsp.buf.definition)
set('n', '<leader>i', vim.lsp.buf.implementation)
set('n', '<leader>rf', vim.lsp.buf.references)
set('n', '<leader>hv', vim.lsp.buf.hover)
set('n', '<leader>a', vim.lsp.buf.code_action)
set('n', '<leader>dt', vim.lsp.buf.type_definition)
set('n', '<leader>n', vim.lsp.buf.format) -- neat
set('n', '<leader>hl', vim.lsp.buf.document_highlight)
set('n', '<leader>hc', vim.lsp.buf.clear_references)

-- show diagnostics
set('n', '<leader>do', vim.diagnostic.open_float)
