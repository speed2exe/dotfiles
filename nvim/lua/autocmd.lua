local vim = vim
local function directory_exists(path)
    return vim.fn.isdirectory(path) == 1
end

local function create_directory_if_not_exists(path)
    if not directory_exists(path) then
        vim.fn.mkdir(path, 'p')
    end
end

-- vim.api.nvim_create_autocmd("CursorHold", {
-- 	callback = function()
--         vim.lsp.buf.hover()
-- 	end
-- })

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        -- create directory if it doesn't exist
        local dir = vim.fn.expand("%:p:h")
        create_directory_if_not_exists(dir)
    end
})
