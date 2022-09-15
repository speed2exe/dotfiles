local actions = require("telescope.actions")
require('telescope').setup {
    defaults = {
        layout_config = {
            height = 0.99,
            width = 0.99,
        },
        mappings = {
            i = { ["<ESC>"] = actions.close },
        },
        border = false,
        prompt_prefix = "",
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        }
    }
}

require('telescope').load_extension('fzy_native')

vim.cmd[[highlight TelescopeNormal guibg=NONE ctermbg=NONE]]
