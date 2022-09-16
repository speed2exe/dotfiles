require('telescope').setup {
    defaults = {
        border = false,
        winblend = 30,
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        }
    }
}

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('file_browser')

vim.cmd[[highlight TelescopeNormal guibg=NONE ctermbg=NONE]]
