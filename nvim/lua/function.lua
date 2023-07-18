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

M.toggle_hlsearch = function()
    vim.opt.hlsearch = not vim.opt.hlsearch:get()
end

return M
