local opt = vim.opt

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
