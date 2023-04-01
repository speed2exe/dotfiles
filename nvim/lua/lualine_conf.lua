local lsp_status = require('lsp-status')
lsp_status.register_progress()
local navic = require('nvim-navic')
local function get_lsp_status()
    return lsp_status.status()
end

local function condition()
    return #vim.lsp.buf_get_clients() > 0
end

local function cwd()
    return vim.fn.getcwd()
end

local function navic_location()
    return navic.get_location()
end

local function navic_is_available()
    return navic.is_available()
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
        lualine_x = { 'diagnostics' },
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
        lualine_x = { 'diagnostics', 'diff', 'branch' },
        lualine_y = {},
        lualine_z = {},
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { { navic_location, cond = navic_is_available } },
        lualine_c = { { get_lsp_status, cond = condition } },
        lualine_x = { 'filesize' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            'mode',
            { navic_location, cond = navic_is_available },
            { get_lsp_status, cond = condition } },
        lualine_x = { 'filesize', 'progress', 'location' },
        lualine_y = {},
        lualine_z = {},
    },
}
