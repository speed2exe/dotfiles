local actions = require("telescope.actions")
require('telescope').setup {
    defaults = {
        mappings = {
            i = { ["<TAB>"] = actions.close },
            n = { ["<TAB>"] = actions.close },
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
