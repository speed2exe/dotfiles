require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    sync_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
    },
    indent = {
        enable = true
    },
    incremental_selection = {
        enable = true,
    },
}
