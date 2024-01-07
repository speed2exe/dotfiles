return {
	'github/copilot.vim',
	{
		"folke/which-key.nvim",
		config = function()
			require('which-key').setup()
		end
	},
	'm00qek/baleia.nvim',
	'onsails/lspkind-nvim',
	{
		'ahmedkhalf/project.nvim',
		config = function()
			require('project_nvim').setup()
		end
	},
	{
		'Mofiqul/dracula.nvim',
		config = function()
			vim.cmd('colorscheme dracula')
		end
	},
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	},
	{
		'nvim-tree/nvim-web-devicons',
		config = function()
			require('nvim-web-devicons').setup()
		end
	},
	'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
	'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',

	-- Telescope stuff
	'nvim-lua/popup.nvim',
	'nvim-lua/plenary.nvim',
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	'nvim-telescope/telescope-file-browser.nvim',

	-- LSP stuff
	{
		'williamboman/mason.nvim',
		config = function()
			require('mason').setup()
		end
	},
	'neovim/nvim-lspconfig',
	'nvim-lua/lsp-status.nvim',

	-- TreeSitter stuff
	'nvim-treesitter/nvim-treesitter-refactor',
	{
		'nvim-treesitter/nvim-treesitter-context',
		config = function()
			require('treesitter-context').setup()
		end
	},

	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-nvim-lsp-signature-help',
	'hrsh7th/cmp-nvim-lsp-document-symbol',
	'hrsh7th/cmp-nvim-lua',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'mtoohey31/cmp-fish',
	'ray-x/cmp-treesitter',
	'dcampos/nvim-snippy',
	'dcampos/cmp-snippy',
}
