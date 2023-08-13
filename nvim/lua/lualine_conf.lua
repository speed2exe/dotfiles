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
        lualine_a = { 'filetype' },
        lualine_b = { { cwd } },
        lualine_c = { { 'filename', file_status = true, newfile_status = true, path = 1 } },
        lualine_x = {},
        lualine_y = { 'diff' },
        lualine_z = { 'branch' },
    },
    inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            'filetype',
            { cwd },
            { 'filename', file_status = true, newfile_status = true, path = 1 }
        },
        lualine_x = { 'diff', 'branch' },
        lualine_y = {},
        lualine_z = {},
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { { get_lsp_status, cond = lsp_is_availabale } },
        lualine_c = { 'diagnostics' },
        lualine_x = { 'filesize' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            'mode',
            { get_lsp_status, cond = lsp_is_availabale },
            { 'diagnostics' },
    	},
        lualine_x = { 'filesize', 'progress', 'location' },
        lualine_y = {},
        lualine_z = {},
    },
}
