local vim = vim
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
  'nvim-lua/plenary.nvim',
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  'nvim-telescope/telescope-file-browser.nvim',

  -- LSP stuff
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  'neovim/nvim-lspconfig',

  -- TreeSitter stuff
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup()
    end
  },

  -- Cmp stuff
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'ray-x/cmp-treesitter',

  -- Zig
  {
    'speed2exe/zig-comp-diag.nvim',
    config = function()
      require('zig-comp-diag').setup()
    end
  }
}
