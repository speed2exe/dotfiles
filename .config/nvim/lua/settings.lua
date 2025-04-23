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
-- highlight NormalFloat     guibg=NONE
-- highlight Pmenu           guibg=NONE
vim.cmd [[
  highlight WinSeparator    guibg=NONE
  highlight StatusLine      guibg=NONE
  highlight TabLineFill     guibg=NONE
  highlight Normal          guibg=NONE
  highlight SignColumn      guibg=NONE
  highlight CmpItemAbbr     guibg=NONE
  highlight LspInlayHint    guibg=NONE

  highlight TelescopeNormal guibg=NONE

  highlight CursorLine     guibg=#282a36 guifg=reverse
  highlight IncSearch      guibg=#44475a guifg=reverse
  highlight Search         guibg=#44475a guifg=reverse
  highlight CurSearch      guibg=#44475a guifg=reverse

  highlight QuickFixLine   guibg=#44475a guifg=reverse
]]

-- remove below code section if issue is resolved
-- https://github.com/neovim/neovim/issues/30985
for _, method in ipairs({ 'textDocument/diagnostic', 'workspace/diagnostic' }) do
  local default_diagnostic_handler = vim.lsp.handlers[method]
  vim.lsp.handlers[method] = function(err, result, context, config)
    if err ~= nil and err.code == -32802 then
      return
    end
    return default_diagnostic_handler(err, result, context, config)
  end
end
