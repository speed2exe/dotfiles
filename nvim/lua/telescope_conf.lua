require('telescope').setup {
    defaults = {
        layout_config = {
            height = .99,
            width = .99,
        },
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    },
    pickers = {
        live_grep = {
            additional_args = function()
                return { "--hidden" }
            end
        },
        find_files = {
            hidden = true,
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
        file_browser = {
            hijack_netrw = true,
            hidden = true,
        },
    },
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')
vim.cmd [[
    highlight TelescopeNormal guibg=NONE ctermbg=NONE
    highlight TelescopeBorder guibg=NONE ctermbg=NONE
]]
