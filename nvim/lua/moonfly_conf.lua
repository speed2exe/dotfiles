vim.cmd [[colorscheme moonfly]]
vim.g.moonflyCursorColor = 1
vim.g.moonflyNormalFloat = 1
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = 'single'
  }
)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signatureHelp, {
    border = 'single'
  }
)
local opts = {noremap = true, silent = true}
vim.api.nvim_buf_set_keymap(0, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next({severity_limit = "Warning", popup_opts = {border = "single"}})<CR>', opts)
vim.api.nvim_buf_set_keymap(0, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev({severity_limit = "Warning", popup_opts = {border = "single"}})<CR>', opts)
vim.g.moonflyTransparent = 1
vim.g.moonflyUnderlineMatchParen = 1
