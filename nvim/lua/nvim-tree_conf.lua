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
    -- { key = "<C-R>",                        cb = tree_cb("remove") },
    { key = "<C-R>",                        cb = tree_cb("trash") },
    -- { key = "r",                            cb = tree_cb("rename") },
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
    auto_reload_on_write = true,
    disable_netrw = true,
    hijack_cursor = true,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup = false,
    open_on_setup = false,
    open_on_setup_file = true,
    open_on_tab = true,
    sort_by = "name",
    update_cwd = false,
    view = {
        width = 30,
        height = 30,
        side = 'left',
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        mappings = {
            custom_only = true,
            list = list,
        },
    },
    renderer = {
        indent_markers = {
            enable = false,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  ",
            },
        },
    },
    hijack_directories   = {
        enable = true,
        auto_open = true,
    },
    update_focused_file = {
        enable = true,
        update_cwd  = true,
        ignore_list = {},
    },
    ignore_ft_on_setup   = {},
    system_open = {
        cmd  = "open",
        args = {}
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    },
    filters  = {
        dotfiles = false,
        custom = {},
        exclude = {},
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 1000,
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
        },
        open_file = {
            quit_on_open = false,
            resize_window = false,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                }
            }
        }
    },
    trash = {
        cmd = "trash",
        require_confirm = true
    },
    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            git = false,
            profile = false,
        },
    },
}
