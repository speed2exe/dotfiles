local navic = require('nvim-navic')
local lsp_status = require('lsp-status')
lsp_status.register_progress()

local function get_lsp_status()
    return lsp_status.status()
end

local function condition()
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
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { { cwd } },
        lualine_c = { { get_lsp_status, cond = condition } },
        lualine_x = { 'filesize' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    winbar = {
        lualine_a = { 'filetype' },
        lualine_b = { { 'filename', file_status = true, newfile_status = true, path = 1 } },
        lualine_c = { { navic.get_location, cond = navic.is_available } },
        lualine_x = { 'diagnostics' },
        lualine_y = { 'diff' },
        lualine_z = { 'branch' },
    },
}
