local vim = vim
local set = vim.keymap.set
local fn = require 'function'
local t_builtin = require 'telescope.builtin'
local baleia = require('baleia')
local ts_ctx = require('treesitter-context')

vim.g.mapleader = ' ';

-- Interpret ansi colors
vim.api.nvim_create_user_command('Ansi', function()
  baleia.setup().once(vim.fn.bufnr())
end, {})

-- Print current working directory
set('n', '<C-c>', '<CMD>pwd<CR>')

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
set('n', '<leader>z', t_builtin.resume)
set('n', '<leader>d', t_builtin.diagnostics)
set('n', '<leader>j', t_builtin.jumplist)
set('n', '<leader>q', t_builtin.quickfix)
set('n', '<leader>g', t_builtin.git_status)
set('n', '<leader>s', t_builtin.live_grep)
set('v', '<leader>s', t_builtin.grep_string)
set('n', '<leader>f', t_builtin.find_files)
set('v', '<leader>f', function()
  t_builtin.find_files({ default_text = table.concat(fn.get_visual_selection_text(), ' ') })
end)

set('n', '<leader>n', t_builtin.lsp_document_symbols)
set('n', '<leader>w', t_builtin.lsp_dynamic_workspace_symbols)
set('n', '<leader>o', function()
  -- https://github.com/nvim-telescope/telescope.nvim/issues/2539
  t_builtin.oldfiles({
    default_text = vim.fn.getcwd() .. '/',
    tiebreak = function(current_entry, existing_entry, _)
      return current_entry.index < existing_entry.index
    end,
  })
end)
set('n', '<leader>b', t_builtin.buffers)
set('n', 'gd', t_builtin.lsp_definitions)
set('n', 'gD', t_builtin.lsp_type_definitions)
set('n', '<leader>i', t_builtin.lsp_implementations)
set('n', '<leader>k', t_builtin.lsp_references)
set('n', '<leader>h', t_builtin.help_tags)
set('n', '<leader>c', t_builtin.lsp_incoming_calls)
set('n', '<leader>t', "<CMD>Telescope file_browser path=%:p:h<CR>") -- traverse

-- Toggle Treesitter Context
set('n', '<C-S>', ts_ctx.toggle)

-- Toggle LSP inlay hints and LSP diagnostics
local show_more = false
set('n', '<C-P>', function()
  show_more = not show_more
  vim.lsp.inlay_hint.enabled = show_more
  vim.diagnostic.config({ virtual_lines = show_more })
end)

-- Custom Personal Mapping
set('n', '<leader>l', vim.lsp.buf.format)
set('n', '<leader>r', vim.lsp.buf.rename)
set('n', '<leader>a', vim.lsp.buf.code_action)
set('v', '<leader>e', ':w! /tmp/nvim-shell-cmd.sh<CR>:term $SHELL < /tmp/nvim-shell-cmd.sh<CR>')

set('n', '<leader>e', ':term ')
-- set('v', '<leader>e', ':$SHELL<CR>')
set('n', '<leader>u', '<CMD>lcd %:p:h<CR>')     -- go to current file directory
set('n', '<leader>x', fn.open_term_at_file_dir) -- open interactive terminal at current file directory

-- quickfix navigation
set('n', '<C-Q>', fn.toggle_quickfix)
set('n', '<C-J>', '<CMD>cnext<CR>')
set('n', '<C-K>', '<CMD>cprevious<CR>')
set('n', '<C-N>', '<CMD>colder<CR>')
set('n', '<C-H>', '<CMD>cnewer<CR>')
