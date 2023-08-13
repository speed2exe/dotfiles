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
}

require('telescope').load_extension('fzf')
