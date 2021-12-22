local tree_cb = require'nvim-tree.config'.nvim_tree_callback
local list = {
    { key = {"<CR>"},                       cb = tree_cb("edit") },
    { key = {"."},                          cb = tree_cb("cd") },
    { key = "<C-v>",                        cb = tree_cb("vsplit") },
    { key = "<C-x>",                        cb = tree_cb("split") },
    { key = "<C-t>",                        cb = tree_cb("tabnew") },
    { key = "u",                            cb = tree_cb("prev_sibling") },
    { key = "d",                            cb = tree_cb("next_sibling") },
    { key = "<ESC>",                        cb = tree_cb("parent_node") },
    { key = "<BS>",                         cb = tree_cb("close_node") },
    { key = "<SPACE>",                      cb = tree_cb("preview") },
    { key = "U",                            cb = tree_cb("first_sibling") },
    { key = "D",                            cb = tree_cb("last_sibling") },
    { key = "i",                            cb = tree_cb("toggle_ignored") },
    { key = "h",                            cb = tree_cb("toggle_dotfiles") },
    { key = "e",                            cb = tree_cb("refresh") },
    { key = "a",                            cb = tree_cb("create") },
    --{ key = "<C-R>",                        cb = tree_cb("remove") },
    { key = "<C-R>",                        cb = tree_cb("trash") },
    --{ key = "r",                            cb = tree_cb("rename") },
    { key = "r",                            cb = tree_cb("full_rename") },
    { key = "x",                            cb = tree_cb("cut") },
    { key = "c",                            cb = tree_cb("copy") },
    { key = "p",                            cb = tree_cb("paste") },
    { key = "y",                            cb = tree_cb("copy_name") },
    { key = "Y",                            cb = tree_cb("copy_path") },
    { key = "<C-y>",                        cb = tree_cb("copy_absolute_path") },
    { key = "(",                            cb = tree_cb("prev_git_item") },
    { key = ")",                            cb = tree_cb("next_git_item") },
    { key = ",",                            cb = tree_cb("dir_up") },
    { key = "s",                            cb = tree_cb("system_open") },
    { key = "q",                            cb = tree_cb("close") },
    { key = "?",                            cb = tree_cb("toggle_help") },
}

require'nvim-tree'.setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = false,
    ignore_ft_on_setup  = {},
    auto_close          = true,
    open_on_tab         = true,
    update_to_buf_dir   = {
        enable = true,
        auto_open = true,
    },
    hijack_cursor       = true,
    update_cwd          = false,
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    },
    update_focused_file = {
        enable = true,
        update_cwd  = true,
        ignore_list = {},
    },
    system_open = {
        cmd  = nil,
        args = {}
    },
    filters  = {
        dotfiles = false,
        custome = {}
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 1000,
    },
    view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = 'left',
        auto_resize = true,
        mappings = {
            custom_only = true,
            list = list
        }
    },
    trash = {
        cmd = "trash",
        require_confirm = true
    }
}

