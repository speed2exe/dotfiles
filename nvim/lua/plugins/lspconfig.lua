return {
	'neovim/nvim-lspconfig',
	config = function()
		require('mason').setup()
		require('mason-lspconfig').setup()
		local lspconfig = require('lspconfig')
		require('mason-lspconfig').setup_handlers({
			function (server)
				lspconfig[server].setup{}
			end
		})
	end
}
