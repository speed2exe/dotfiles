require 'nvim-treesitter.configs'.setup {
    refactor = {
        highlight_definitions = {
            enable = true,
            clear_on_cursor_move = true
        },
        -- highlight_current_scope = { enable = true },

        -- use LSP rename and nav
        -- smart_rename = {
        --     enable = true,
        --     keymaps = {
        --         smart_rename = "grr",
        --     },
        -- },
        -- navigation = {
        --     enable = true,
        --     keymaps = {
        --         goto_definition = "gnd",
        --         list_definitions = "gnD",
        --         list_definitions_toc = "gO",
        --         goto_next_usage = "<a-*>",
        --         goto_previous_usage = "<a-#>",
        --     },
        -- },

        -- playground = {
        --     enable = true,
        --     disable = {},
        --     updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        --     persist_queries = false, -- Whether the query persists across vim sessions
        --     keybindings = {
        --         toggle_query_editor = 'o',
        --         toggle_hl_groups = 'i',
        --         toggle_injected_languages = 't',
        --         toggle_anonymous_nodes = 'a',
        --         toggle_language_display = 'I',
        --         focus_language = 'f',
        --         unfocus_language = 'F',
        --         update = 'e',
        --         goto_node = '<cr>',
        --         show_help = '?',
        --     },
        -- },

        -- query_linter = {
        --     enable = true,
        --     use_virtual_text = true,
        --     lint_events = { "BufWrite", "CursorHold" },
        -- },

    },
}
