local opt = vim.opt

opt.guicursor = ''
opt.clipboard = 'unnamedplus'
opt.number = true
opt.relativenumber = true
opt.signcolumn = 'yes'
opt.swapfile = false
opt.cursorline = true
opt.statusline = '%f:%l:%c'
opt.wrap = false

-- Tabs and Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

vim.cmd.colorscheme('dracula')
local nvim_set_hl = vim.api.nvim_set_hl
nvim_set_hl(0, 'WinSeparator', {})
nvim_set_hl(0, 'StatusLine', {})
nvim_set_hl(0, 'TabLineFill', {})
nvim_set_hl(0, 'Normal', {})
nvim_set_hl(0, 'SignColumn', {})
nvim_set_hl(0, 'CmpItemAbbr', {})
nvim_set_hl(0, 'LspInlayHint', {})
nvim_set_hl(0, 'NormalFloat', {})
nvim_set_hl(0, 'Pmenu', {})
nvim_set_hl(0, 'TelescopeNormal', {})
