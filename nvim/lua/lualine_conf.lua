local navic = require('nvim-navic')
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '|', right = '|', },
        section_separators = { left = '', right = '', },
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = true
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', { 'diagnostics', sources = {'nvim_diagnostic'} }, },
        lualine_c = { 'filename', { navic.get_location, cond = navic.is_available } },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    tabline = {},
    extensions = {'nvim-tree'}
}

