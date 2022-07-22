require('telescope').setup {
    defaults = {
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
