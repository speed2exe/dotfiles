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
opt.timeoutlen = 300
opt.updatetime = 0
opt.signcolumn = 'yes'
opt.cursorline = true

-- TODO:
-- commands that cannot be represented in neovim
-- hopefully pure lua equivalent of the following commands
-- can be implemented in neovim in the future
--
-- https://draculatheme.com/contribute
-- use same background color as dracula theme
--
-- https://vim.fandom.com/wiki/Remove_unwanted_spaces
--
-- g.copilot_no_tab_map = true
-- vim.keymap.set('i', '<RIGHT>', '<Plug>(copilot-accept)')
-- vim.keymap.set('i', '<DOWN>', '<Plug>(copilot-next)')
-- vim.keymap.set('i', '<UP>', '<Plug>(copilot-prev)')
vim.cmd [[
    colorscheme dracula

    autocmd BufWritePre * :%s/\s\+$//e

    inoremap <silent><script><expr> <RIGHT> copilot#Accept("<RIGHT>")
    inoremap <S-DOWN> <Plug>(copilot-next)
    inoremap <S-UP> <Plug>(copilot-previous)
    inoremap <S-LEFT> <Plug>(copilot-dismiss)
    inoremap <S-RIGHT> <Plug>(copilot-suggest)

    highlight WinSeparator guibg=NONE ctermbg=NONE
    highlight Normal guibg=NONE ctermbg=NONE
    highlight CursorLine guibg=#282a36
]]

-- netrw
-- g.netrw_liststyle = 3
