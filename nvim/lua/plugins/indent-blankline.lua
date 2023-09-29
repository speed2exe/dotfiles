return {
	'lukas-reineke/indent-blankline.nvim',
	main = 'ibl',
	config = function()
		require('ibl').setup {
			show_current_context = true,
			show_current_context_start = false,
			use_treesitter = true,
			use_treesitter_scope = true,
		}
	end
}
