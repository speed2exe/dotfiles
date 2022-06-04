local config_group = vim.api.nvim_create_augroup('MyConfigGroup', {}) -- A global group for all your config autocommands

vim.api.nvim_create_autocmd({ 'SessionLoadPost' }, {
	group = config_group,
	callback = function()
		require('nvim-tree').toggle(false, true)
	end,
})
