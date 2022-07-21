M = {}

require('lsp_lines').register_lsp_virtual_lines()

vim.diagnostic.config({virtual_text = false})

local toggle_virtual_lines = true
function M.toggle_virtual_lines()
    toggle_virtual_lines = not toggle_virtual_lines
    vim.diagnostic.config({virtual_lines = toggle_virtual_lines})
end

return M
