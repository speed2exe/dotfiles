local tree_cb = require'nvim-tree.config'.nvim_tree_callback
local list = {
	{ key = {"<CR>"},                       cb = tree_cb("edit") },
	{ key = {"."},                          cb = tree_cb("cd") },
	{ key = "<C-v>",                        cb = tree_cb("vsplit") },
	{ key = "<C-x>",                        cb = tree_cb("split") },
	{ key = "<C-t>",                        cb = tree_cb("tabnew") },
	{ key = "<TAB>",                        cb = tree_cb("next_sibling") },
	{ key = "<S-TAB>",                      cb = tree_cb("prev_sibling") },
	{ key = "<BS>",                         cb = tree_cb("parent_node") },
	-- { key = "<CR>",                         cb = tree_cb("close_node") },
	{ key = "<SPACE>",                      cb = tree_cb("preview") },
	{ key = "U",                            cb = tree_cb("first_sibling") },
	{ key = "D",                            cb = tree_cb("last_sibling") },
	{ key = "i",                            cb = tree_cb("toggle_ignored") },
	{ key = "h",                            cb = tree_cb("toggle_dotfiles") },
	{ key = "e",                            cb = tree_cb("refresh") },
	{ key = "a",                            cb = tree_cb("create") },
	-- { key = "<C-R>",                        cb = tree_cb("remove") },
	{ key = "<C-R>",                        cb = tree_cb("trash") },
	{ key = "r",                            cb = tree_cb("rename") },
	{ key = "R",                            cb = tree_cb("full_rename") },
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
	{ key = "H",                            cb = tree_cb("toggle_help") },
}

require'nvim-tree'.setup {
	auto_reload_on_write = true,
	create_in_closed_folder = false,
	disable_netrw = true,
	hijack_cursor = true,
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = false,
	ignore_buffer_on_setup = false,
	open_on_setup = false,
	open_on_setup_file = false,
	open_on_tab = false,
	sort_by = "name",
	update_cwd = false,
	reload_on_bufenter = true,
	respect_buf_cwd = true,
	view = {
		width = 30,
		height = 30,
		hide_root_folder = false,
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
		add_trailing = true,
		group_empty = true,
		highlight_git = true,
		highlight_opened_files = "all",
		root_folder_modifier = ":~",
		indent_markers = {
			enable = true,
			icons = {
				corner = "??? ",
				edge = "??? ",
				none = "  ",
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = "before",
			padding = " ",
			symlink_arrow = " ??? ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "???",
				symlink = "???",
				folder = {
					arrow_closed = "???",
					arrow_open = "???",
					default = "???",
					open = "???",
					empty = "???",
					empty_open = "???",
					symlink = "???",
					symlink_open = "???",
				},
				git = {
					unstaged = "???",
					staged = "???",
					unmerged = "???",
					renamed = "???",
					untracked = "???",
					deleted = "???",
					ignored = "???",
				},
			},
		},
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
	},
	hijack_directories = {
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
			hint = "???",
			info = "???",
			warning = "???",
			error = "???",
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
			restrict_above_cwd = false;
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
	live_filter = {
		prefix = "[FILTER]: ",
		always_show_folders = true,
	},
	log = {
		enable = false,
		truncate = false,
		types = {
			all = false,
			config = false,
			copy_paste = false,
			diagnostics = false,
			git = false,
			profile = false,
		},
	},
}
