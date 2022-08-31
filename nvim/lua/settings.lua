local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

opt.shell = '/usr/sbin/fish'
opt.clipboard:prepend{'unnamed', 'unnamedplus'}
opt.termguicolors = true
opt.showmode = false
opt.hlsearch = false
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true
opt.shiftwidth = 4
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
opt.completeopt = {'menu', 'menuone', 'preview'}
opt.splitbelow = true
opt.splitright = true
opt.wildmode = {'longest:full', 'full'}
opt.lazyredraw = true

-- crisp split
cmd [[highlight WinSeparator guibg=None]]

-- Github copilot stuff
g.copilot_no_tab_map = true

-- neovide stuff
opt.guifont = 'iosevka2:h12'
g.neovide_cursor_antialiasing = true
g.neovide_transparency =0.5
