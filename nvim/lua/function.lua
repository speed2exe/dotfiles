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

return M
