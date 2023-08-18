local vim = vim
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

local function user()
    return vim.env.USER
end

require('lualine').setup {
    options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
    },
    winbar = {
        lualine_a = { 'filetype' },
        lualine_b = { cwd },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { user },
        lualine_y = { 'hostname' },
        lualine_z = {},
    },
    inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filetype', cwd, { 'filename', path = 1 } },
        lualine_x = { user, 'hostname' },
        lualine_y = {},
        lualine_z = {},
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'location' },
        lualine_c = { 'progress' },
        lualine_x = { { get_lsp_status, cond = lsp_is_availabale }, 'diagnostics' },
        lualine_y = { 'diff', 'branch' },
        lualine_z = {},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'mode', 'location', 'progress' },
        lualine_x = { { get_lsp_status, cond = lsp_is_availabale }, 'diagnostics', 'diff', 'branch' },
        lualine_y = {},
        lualine_z = {},
    },
}
