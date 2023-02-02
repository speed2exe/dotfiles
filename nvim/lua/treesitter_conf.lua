require 'nvim-treesitter.configs'.setup {
    auto_install = true,
    incremental_selection = {
        enable = true,
        keymaps = {
            node_incremental = "<TAB>",
            node_decremental = "<S-TAB>",
        },
    },
    highlight = {
        enable = true,
    }
}
