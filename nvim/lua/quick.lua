M = {}

local toggle_virtual_text = false
function M.toggle_virtual_text()
    toggle_virtual_text = not toggle_virtual_text
    vim.diagnostic.config({virtual_text = toggle_virtual_text})
end

return M
