require 'nvim-treesitter.configs'.setup {
	auto_install = true,
	highlight = {
		enable = true,
	},
	refactor = {
		highlight_definitions = {
			enable = true,
			-- Set to false if you have an `updatetime` of ~100.
			clear_on_cursor_move = true,
		},
		-- highlight_current_scope = { enable = true },
	},
}
