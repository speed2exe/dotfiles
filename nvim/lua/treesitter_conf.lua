require 'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    sync_install = false,
    auto_install = true,
    ignore_install = { "phpdoc" },
    highlight = {
        enable = true,
        -- additional_vim_regex_highlighting = true,
    },
    indent = {
        enable = false,
    },

    -- conflict with `gn` keymap
    -- replace with lsp
    -- incremental_selection = {
    --     enable = true,
    -- },
}
