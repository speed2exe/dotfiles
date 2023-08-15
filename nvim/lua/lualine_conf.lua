local lsp_status = require('lsp-status')
lsp_status.register_progress()
local function get_lsp_status()
    return string.sub(lsp_status.status(), 6)
end

local function lsp_is_availabale()
    return #vim.lsp.buf_get_clients() > 0
end

local function cwd()
    return vim.fn.getcwd()
end

require('lualine').setup {
    options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
    },
    winbar = {
        lualine_a = { { cwd } },
        lualine_b = { { 'filename', path = 1 } },
        lualine_c = { 'location' },
        lualine_x = { 'progress' },
        lualine_y = {},
        lualine_z = {},
    },
    inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { cwd }, { 'filename', path = 1 }, 'location' },
        lualine_x = { 'progress' },
        lualine_y = {},
        lualine_z = {},
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'filetype' },
        lualine_c = { { get_lsp_status, cond = lsp_is_availabale }, 'diagnostics' },
        lualine_x = { 'diff', 'branch' },
        lualine_y = {},
        lualine_z = {},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'mode', 'filetype', { get_lsp_status, cond = lsp_is_availabale }, 'diagnostics' },
        lualine_x = { 'diff', 'branch' },
        lualine_y = {},
        lualine_z = {},
    },
}
