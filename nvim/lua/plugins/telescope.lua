return {
	'nvim-telescope/telescope.nvim',
	config = function()
		require('telescope').setup {
			defaults = {
				layout_config = {
					height = .99,
					width = .99,
				},
				borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			},
			pickers = {
				live_grep = {
					additional_args = function()
						return { "--hidden" }
					end
				},
				find_files = {
					hidden = true,
				},
			},
			extensions = {
				file_browser = {
					hijack_netrw = true,
					hidden = true,
				},
			}
		}

		require('telescope').load_extension('fzf')
		require('telescope').load_extension('file_browser')
	end
}