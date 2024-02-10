-- module store custom created functions

local M = {}
local vim = vim

vim.diagnostic.config({ virtual_lines = false })
local init = false
M.toggle_lsp_lines = function()
    if not init then
        require('lsp_lines').setup()
        init = true
    end

    local enabled = vim.diagnostic.config().virtual_lines
    vim.diagnostic.config({
        virtual_lines = not enabled,
        virtual_text = enabled,
    })
end

M.toggle_quickfix = function()
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      vim.cmd "cclose"
      return
    end
  end
  vim.cmd "copen"
end

return M
