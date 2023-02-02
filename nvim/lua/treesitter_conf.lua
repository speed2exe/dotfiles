require 'nvim-treesitter.configs'.setup {
    auto_install = true,
    incremental_selection = {
        enable = true,
        keymaps = {
            -- init_selection = "gnn",
            node_incremental = "<CR>",
            -- scope_incremental = "vv",
            -- node_decremental = "grm",
        },
    },
    highlight = {
        enable = true,
    }
}
