local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

opt.clipboard:prepend { 'unnamed', 'unnamedplus' }
opt.termguicolors = true
opt.showmode = false
opt.hlsearch = false
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.breakindent = true
opt.wrap = false
opt.number = true
opt.relativenumber = true
opt.ignorecase = true
opt.smartcase = true
opt.swapfile = false
opt.writebackup = false
opt.scrolloff = 16
opt.splitbelow = true
opt.splitright = true
opt.lazyredraw = true
opt.timeoutlen = 500
opt.updatetime = 0
opt.winbar = '%f'
opt.signcolumn = 'yes'
opt.cursorline = true

-- TODO:
-- commands that cannot be represented in neovim
-- hopefully pure lua equivalent of the following commands
-- can be implemented in neovim in the future
vim.cmd [[colorscheme dracula]]

-- Github copilot stuff
g.copilot_no_tab_map = true

-- netrw
g.netrw_liststyle = 3
