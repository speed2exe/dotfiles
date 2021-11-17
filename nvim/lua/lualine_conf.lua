require'lualine'.setup {
    options = {
        theme = 'auto',
        component_separators = {
            left = '', 
            right = '',
        },
        section_separators = {
            left = '',
            right = '',
        },
        disabled_filetypes = {}
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    tabline = {},
    extensions = {'nvim-tree'}
}

