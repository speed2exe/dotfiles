local opt = vim.opt

opt.clipboard:prepend { 'unnamed', 'unnamedplus' }
opt.wrap = false
opt.number = true
opt.relativenumber = true
opt.signcolumn = 'yes'
opt.swapfile = false
opt.timeoutlen = 0
opt.updatetime = 0
opt.cursorline = true
opt.guicursor = "" -- always use block
opt.cmdheight = 0

-- Tabs and Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- TODO:
-- commands that cannot be represented in neovim
-- hopefully pure lua equivalent of the following commands
-- can be implemented in neovim in the future
--
-- https://draculatheme.com/contribute
-- use same background color as dracula theme
--
-- https://vim.fandom.com/wiki/Remove_unwanted_spaces
vim.cmd [[
  colorscheme dracula

  autocmd BufWritePre * :%s/\s\+$//e

  inoremap <silent><script><expr> <RIGHT> copilot#Accept("<RIGHT>")
  inoremap <S-DOWN> <Plug>(copilot-next)
  inoremap <S-UP> <Plug>(copilot-previous)
  inoremap <S-LEFT> <Plug>(copilot-dismiss)
  inoremap <S-RIGHT> <Plug>(copilot-suggest)

  highlight WinSeparator    guibg=NONE
  highlight Normal          guibg=NONE
  highlight SignColumn      guibg=NONE
  highlight CmpItemAbbr     guibg=NONE

  highlight TelescopeNormal guibg=NONE
  highlight NormalFloat     guibg=NONE

  highlight CursorLine     guibg=#282a36 guifg=reverse
  highlight IncSearch      guibg=#44475a guifg=reverse
  highlight Search         guibg=#44475a guifg=reverse

  highlight QuickFixLine   guibg=#44475a guifg=reverse
]]
