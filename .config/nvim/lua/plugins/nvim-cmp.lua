return {
  'hrsh7th/nvim-cmp',
  config = function()
    local cmp = require('cmp')
    local lspkind = require('lspkind')

    -- modified from: https://github.com/hrsh7th/nvim-cmp?tab=readme-ov-file#recommended-configuration
    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ['<C-U>'] = cmp.mapping.scroll_docs(-4),
        ['<C-D>'] = cmp.mapping.scroll_docs(4),
        ['<C-C>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
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
    cmp.setup.cmdline({ '/', '?' }, {
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
      ),
      matching = { disallow_symbol_nonprefix_matching = false }
    })
  end
}
