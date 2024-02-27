local vim = vim
local set = vim.keymap.set
local fn = require 'function'
local t_builtin = require 'telescope.builtin'
local baleia = require('baleia')

vim.g.mapleader = ' ';

-- Interpret ansi colors
vim.api.nvim_create_user_command('Ansi', function()
  baleia.setup().once(vim.fn.bufnr())
end, {})

-- Remove lines with only whitespace or nothing
set('v', '<leader><BS>', ':g/^\\s*$/d<CR>')

-- higlight yanked text, or just edited text
set('n', '<leader>v', '`[v`]')

-- Search and replace for clipboard content on visually selected
set('v', '<leader>/', ':s/<C-R>"/<C-R>"')

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

-- Telescope
set('n', '<leader><C-R>', t_builtin.resume)
set('n', '<leader><C-H>', t_builtin.help_tags)
set('n', '<leader>d', t_builtin.diagnostics)
set('n', '<leader><C-K>', t_builtin.keymaps)
set('n', '<leader>j', t_builtin.jumplist)
set('n', '<leader>q', t_builtin.quickfix)
set('n', '<leader>R', t_builtin.registers)
set('n', '<leader><C-M>', t_builtin.marks)
set('n', '<leader>f', t_builtin.find_files)
set('n', '<leader><C-F>', t_builtin.git_files)
set('n', '<leader>s', t_builtin.live_grep) -- search
set('v', '<leader>s', t_builtin.grep_string)
set('n', '<leader><C-S>', t_builtin.lsp_dynamic_workspace_symbols)
set('n', '<leader>o', t_builtin.oldfiles)
set('n', '<leader>b', t_builtin.buffers)
set('n', '<leader>g', t_builtin.lsp_definitions)
set('n', '<leader>x', t_builtin.lsp_type_definitions)
set('n', '<leader>i', t_builtin.lsp_implementations)
set('n', '<leader>k', t_builtin.lsp_references)
set('n', '<leader>t', "<CMD>Telescope file_browser path=%:p:h<CR>") -- traverse

-- Toggle LSP diagnostics
set('n', '<leader>l', fn.toggle_lsp_lines) -- diagnostics line

-- Custom Personal Mapping
set('n', '<leader>r', vim.lsp.buf.rename)
set('n', '<leader>h', vim.lsp.buf.hover)
set('n', '<leader>a', vim.lsp.buf.code_action)
set('n', '<leader>n', vim.lsp.buf.format) -- neat
set('n', '<leader>e', ':term ')
set('v', '<leader>e', 'y:term <C-R>"<CR>')
set('n', '<leader>u', '<CMD>lcd %:p:h<CR>') -- go to current file directory
set('n', '<leader>m', vim.diagnostic.open_float)
-- set('n', '<leader>d', vim.diagnostic.setqflist)
-- set('n', '<leader>g', vim.lsp.buf.definition)
-- set('n', '<leader>x', vim.lsp.buf.type_definition)
-- set('n', '<leader>c', vim.lsp.buf.incoming_calls)
-- set('n', '<leader>k', vim.lsp.buf.references)
-- set('n', '<leader>t', '<CMD>term exa --icons --sort accessed --color-scale=all --no-quotes --long --all --binary --time-style long-iso --git<CR>')
-- set('n', '<leader>i', vim.lsp.buf.implementation)
-- set('n', '<leader>s', ':term rg --hidden --no-ignore --no-heading ')
-- set('v', '<leader>s', 'y:term rg --hidden --no-ignore --no-heading <C-R>"<CR>')
-- set('n', '<leader>f', ':term fd --hidden --no-ignore ')
-- set('v', '<leader>f', 'y:term fd --hidden --no-ignore <C-R>"<CR>')

-- quickfix navigation
set('n', '<C-Q>', fn.toggle_quickfix)
set('n', '<C-J>', '<CMD>cnext<CR>')
set('n', '<C-K>', '<CMD>cprevious<CR>')
set('n', '<C-N>', '<CMD>colder<CR>')
set('n', '<C-H>', '<CMD>cnewer<CR>')

-- -- current buffers to quickfix
-- set('n', '<leader>b', function()
--   local loaded = {}
--   for _, value in pairs(vim.fn.getbufinfo()) do
--     if value.listed == 1 then
--       table.insert(loaded, value)
--     end
--   end
--   vim.fn.setqflist(loaded)
--   vim.cmd [[ copen ]]
-- end)
--
-- -- list oldfiles in a throwaway buffer
-- set('n', '<leader>o', function()
--   local res = {}
--   for _, value in ipairs(vim.v.oldfiles) do
--     if string.sub(value, 1, 1) == '/' then
--       table.insert(res, {filename = value})
--     end
--   end
--   vim.fn.setqflist(res)
--   vim.cmd [[ copen ]]
-- end)
