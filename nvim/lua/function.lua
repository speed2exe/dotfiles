-- module store custom created functions

local M = {}
local vim = vim

M.toggle_quick_fix_list = function()
    local qf_exists = false
    for _, win in pairs(vim.fn.getwininfo()) do
        if win["quickfix"] == 1 then
            qf_exists = true
        end
    end
    if qf_exists == true then
        vim.cmd "cclose"
        return
    end
    if not vim.tbl_isempty(vim.fn.getqflist()) then
        vim.cmd "copen"
    end
end

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
