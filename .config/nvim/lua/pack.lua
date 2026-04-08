-- Build telescope-fzf-native on install/update
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    if ev.data.spec.name == 'telescope-fzf-native.nvim' and (ev.data.kind == 'install' or ev.data.kind == 'update') then
      vim.system({ 'make' }, { cwd = ev.data.path }):wait()
    end
  end,
})

vim.pack.add({
  -- Editor
  'https://github.com/github/copilot.vim',
  'https://github.com/folke/which-key.nvim',
  'https://github.com/m00qek/baleia.nvim',
  'https://github.com/onsails/lspkind-nvim',
  'https://github.com/Mofiqul/dracula.nvim',
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',
  'https://github.com/lukas-reineke/indent-blankline.nvim',

  -- Telescope
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
  'https://github.com/nvim-telescope/telescope-file-browser.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',

  -- LSP
  'https://github.com/williamboman/mason.nvim',
  'https://github.com/williamboman/mason-lspconfig.nvim',
  'https://github.com/neovim/nvim-lspconfig',

  -- TreeSitter
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nvim-treesitter/nvim-treesitter-context',

  -- Completion
  'https://github.com/hrsh7th/nvim-cmp',
  'https://github.com/hrsh7th/cmp-nvim-lsp',
  'https://github.com/hrsh7th/cmp-nvim-lsp-signature-help',
  'https://github.com/hrsh7th/cmp-nvim-lua',
  'https://github.com/hrsh7th/cmp-cmdline',
  'https://github.com/hrsh7th/cmp-buffer',
  'https://github.com/hrsh7th/cmp-path',
  'https://github.com/ray-x/cmp-treesitter',

  -- Zig
  'https://github.com/speed2exe/zig-comp-diag.nvim',
})

------------------------------------------------------------------------
-- Plugin configurations
------------------------------------------------------------------------

-- Mason + LSP
require('mason').setup()
require('mason-lspconfig').setup()

-- Treesitter
require('nvim-treesitter').setup()

-- Telescope
require('telescope').setup({
  defaults = {
    layout_config = {
      height = .99,
      width = .99,
    },
    borderchars = { '', '', '', '', '', '', '', '' },
  },
  pickers = {
    live_grep = {
      additional_args = function()
        return { '--no-ignore', '--hidden' }
      end
    },
    find_files = {
      no_ignore = true,
      hidden = true,
    },
  },
  extensions = {
    file_browser = {
      hijack_netrw = true,
      hidden = true,
      no_ignore = true,
    },
  },
})
require('telescope').load_extension('file_browser')
pcall(require('telescope').load_extension, 'fzf')

-- nvim-cmp
local cmp = require('cmp')
local lspkind = require('lspkind')
cmp.setup({
  mapping = cmp.mapping.preset.insert({}),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'treesitter' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'nvim_lua' },
  },
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      menu = {
        nvim_lsp = '[LSP]',
        nvim_lsp_signature_help = '[signature]',
        treesitter = '[TS]',
        path = '[path]',
        buffer = '[buf]',
        nvim_lua = '[lua]',
      },
    }),
  },
})
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources(
    { { name = 'buffer' } }
  ),
})
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources(
    { { name = 'path' } },
    { { name = 'cmdline' } }
  ),
  matching = { disallow_symbol_nonprefix_matching = false },
})

-- indent-blankline
require('ibl').setup({})

-- zig-comp-diag
require('zig-comp-diag').setup({})
