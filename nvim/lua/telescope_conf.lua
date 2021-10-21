require('telescope').setup {
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-h>"] = "which_key"
            }
        }
    },

    pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker

        -- cursor
        lsp_code_actions = {
            theme = "cursor",
        },
        lsp_range_code_actions = {
            theme = "cursor",
        },

        -- ivy
        lsp_definitions = {
            theme = "ivy",
        },
        lsp_type_definitions = {
            theme = "ivy",
        },
        lsp_implementations = {
            theme = "ivy",
        },
        grep_string = {
            theme = "ivy",
        },
        lsp_references = {
            theme = "ivy",
        },

        -- dropdown
        find_files = {
            theme = "dropdown",
        },
        lsp_document_diagnostics = {
            theme = "dropdown",
        },
        lsp_workspace_diagnostics = {
            theme = "dropdown",
        },
    },

    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzy_native')
