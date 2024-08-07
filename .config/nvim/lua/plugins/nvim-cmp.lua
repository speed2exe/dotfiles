return {
  'hrsh7th/nvim-cmp',
  config = function()
    local cmp = require('cmp')
    local lspkind = require('lspkind')

    cmp.setup({
      mapping = cmp.mapping.preset.insert(),
      sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'treesitter' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'nvim_lua' },
      },
      formatting = {
        format = lspkind.cmp_format {
          with_text = true,
          menu = {
            nvim_lsp = "[LSP]",
            nvim_lsp_signature_help = "[signature]",
            treesitter = "[TS]",
            path = "[path]",
            buffer = "[buf]",
            nvim_lua = "[lua]",
          },
        },
      },
    })
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources(
        { { name = 'buffer' } }
      )
    })
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources(
        { { name = 'path' } },
        { { name = 'cmdline' } }
      )
    })
  end
}
