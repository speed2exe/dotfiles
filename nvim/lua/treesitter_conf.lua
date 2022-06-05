require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    sync_install = true,
    ignore_install = {"phpdoc"},
    highlight = {
        enable = true,
		disable = {},
        additional_vim_regex_highlighting = true,
    },
    indent = {
        enable = false,
    },
    incremental_selection = {
        enable = true,
    },
}
