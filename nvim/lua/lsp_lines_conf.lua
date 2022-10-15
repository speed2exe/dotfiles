M = {}

require('lsp_lines').setup()

vim.diagnostic.config({virtual_lines = false})

local use_lines = false
function M.toggle_inline_text()
    vim.diagnostic.config({virtual_text = use_lines})
    use_lines = not use_lines
    vim.diagnostic.config({virtual_lines = use_lines})
end

return M
