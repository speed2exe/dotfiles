local vim = vim
local set = vim.keymap.set
local fn = require 'function'
-- local t_builtin = require 'telescope.builtin'
local baleia = require('baleia')

vim.g.mapleader = ' ';

-- Interpret ansi colors
set('n', '<leader>c', function() baleia.setup().once(vim.fn.bufnr()) end)

-- Remove lines with only whitespace or nothing
set('v', '<leader><BS>', ':g/^\\s*$/d<CR>')

-- higlight yanked text, or just edited text
set('n', '<leader>v', '`[v`]')

-- Search and replace for clipboard content on visually selected
set('v', '<leader>s', ':s/<C-R>"/<C-R>"')

-- yank current file content to clipboard
set('n', '<leader>yy', '<CMD>:%y+<CR>')
-- copy current file directory to clipboard
set('n', '<leader>yd', '<CMD>let @+ = expand("%:p:h")<CR>')
-- copy current file path to clipboard
set('n', '<leader>yf', '<CMD>let @+ = expand("%:p")<CR>')
-- copy current file path with line number to clipboard
set('n', '<leader>yl', '<CMD>let @+ = join([expand("%:p"), line(".")], ":")<CR>')
-- copy current file path with line number and column number to clipboard
set('n', '<leader>yc', function()
	local p = vim.fn.expand("%:p")
	local l = vim.fn.line('.')
	local c = vim.fn.col('.')
	local result = p .. ":" .. l .. ":" .. c
	vim.fn.setreg("+", result)
end)

-- go to project root
set('n', '<leader>p', '<CMD>ProjectRoot<CR>')
-- go to current file directory
set('n', '<leader>u', '<CMD>lcd %:p:h<CR>')

-- Telescope
-- set('n', '<leader>rs', t_builtin.resume)
-- set('n', '<leader>ht', t_builtin.help_tags)
-- set('n', '<leader>dn', t_builtin.diagnostics)
-- set('n', '<leader>k', t_builtin.keymaps)
-- set('n', '<leader>j', t_builtin.jumplist)
-- set('n', '<leader>q', t_builtin.quickfix)
-- set('n', '<leader>rg', t_builtin.registers)
-- set('n', '<leader>m', t_builtin.marks)
-- set('n', '<leader>f', t_builtin.find_files)
-- set('n', '<leader>g', t_builtin.git_files)
-- set('n', '<leader>s', t_builtin.live_grep) -- search
-- set('n', '<leader>l', t_builtin.lsp_dynamic_workspace_symbols)
-- set('n', '<leader>o', t_builtin.oldfiles)
-- set('n', '<leader>b', t_builtin.buffers)
-- set('n', '<leader>df', t_builtin.lsp_definitions)
-- set('n', '<leader>dt', t_builtin.lsp_type_definitions)
-- set('n', '<leader>i', t_builtin.lsp_implementations)
-- set('n', '<leader>rf', t_builtin.lsp_references)
-- set('n', '<leader>t', "<CMD>Telescope file_browser path=%:p:h<CR>") -- traverse

-- Toggle LSP diagnostics
set('n', '<leader>l', fn.toggle_lsp_lines) -- diagnostics line

-- Custom Personal Mapping
set('n', '<leader>r', vim.lsp.buf.rename)
set('n', '<leader>h', vim.lsp.buf.hover)
set('n', '<leader>a', vim.lsp.buf.code_action)
set('n', '<leader>n', vim.lsp.buf.format) -- neat
set('n', '<leader>do', vim.diagnostic.open_float)
set('n', '<leader>dq', vim.diagnostic.setqflist)
set('n', '<leader>dn', vim.diagnostic.goto_next)
set('n', '<leader>dp', vim.diagnostic.goto_prev)
set('n', '<leader>e', ':term ')
set('v', '<leader>e', 'y:term <C-R>"<CR>')
set('n', '<leader>g', vim.lsp.buf.definition)
set('n', '<leader>x', vim.lsp.buf.type_definition)
set('n', '<leader>k', vim.lsp.buf.references)
set('n', '<leader>t', ':term tree -fC --gitignore ')
set('n', '<leader>i', vim.lsp.buf.implementation)
set('n', '<leader>o', '<CMD> enew | redir => m | silent oldfiles | redir END | silent put=m | silent %s/^[0-9]*: // | silent %v/^\\//d | noh | set buftype=nofile | set syntax=rust | 1 <CR>')
set('n', '<leader>b', '<CMD> enew | redir => m | silent buffers | redir END | silent put=m | silent %s/.\\{-}"// | silent %s/".*line /:/ | silent %s/\\[.*// | silent %s/.*:\\/\\/.*// | silent %g/^$/d | noh | set buftype=nofile | set syntax=rust | 1 <CR>')
set('n', '<leader>j', '<CMD> enew | redir => m | silent jumps | redir END | put=m | silent %s/.*:\\/\\/.*// | silent! :%s/ *[0-9]* *[0-9]* *[0-9]* $// | silent %g/^$/d <CR>Gddggdj <CMD> %normal wwhyt $pF r:0veeelx<CR><CMD>noh | set buftype=nofile | set syntax=rust | 1 <CR>')
set('n', '<leader>m', ':enew<CR>:redir => m | silent marks | redir END | put=m<CR>ggdj^:set buftype=nofile<CR>')
set('n', '<leader>q', fn.toggle_quickfix)
set('n', '<leader>s', ':term rg --no-heading ')
set('n', '<leader>f', ':term fd --hidden --no-ignore ')
