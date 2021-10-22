require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true
    },
    refactor = {
        highlight_current_scope = { enable = true},
        highlight_definitions = { enable = true},
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "gr",
            },
        },
    },
}
