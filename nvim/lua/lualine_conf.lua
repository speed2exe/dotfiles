local navic = require('nvim-navic')
local lsp_status = require('lsp-status')
lsp_status.register_progress()

local function get_lsp_status()
    return lsp_status.status()
end

local function condition()
    return #vim.lsp.buf_get_clients() > 0
end

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'dracula',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = true
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename', { navic.get_location, cond = navic.is_available } },
        lualine_x = { { get_lsp_status, cond = condition }, 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    tabline = {},
    extensions = {'nvim-tree'}
}
