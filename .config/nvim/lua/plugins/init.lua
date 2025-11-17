local vim = vim

return {
  'github/copilot.vim',
  'folke/which-key.nvim',
  'm00qek/baleia.nvim',
  'onsails/lspkind-nvim',
  'Mofiqul/dracula.nvim',
  'lewis6991/gitsigns.nvim',
  'nvim-tree/nvim-web-devicons',
  'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',

  -- Telescope stuff
  'nvim-lua/plenary.nvim',
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  'nvim-telescope/telescope-file-browser.nvim',

  -- LSP stuff
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',
  'neovim/nvim-lspconfig',

  -- TreeSitter stuff
  'nvim-treesitter/nvim-treesitter-context',

  -- Cmp stuff
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'ray-x/cmp-treesitter',

  -- Zig
  { 'speed2exe/zig-comp-diag.nvim', opts = {} },
}
