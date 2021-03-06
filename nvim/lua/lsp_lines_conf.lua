M = {}

require('lsp_lines').setup()

vim.diagnostic.config({virtual_text = false})

local inline_text = true
function M.toggle_inline_text()
    inline_text = not inline_text
    vim.diagnostic.config({virtual_lines = inline_text})
    vim.diagnostic.config({virtual_text = not inline_text})
end

return M
