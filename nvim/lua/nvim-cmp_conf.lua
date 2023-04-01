-- Setup nvim-cmp.
local cmp = require('cmp')
local lspkind = require('lspkind')
lspkind.init()

cmp.setup({
    mapping = {
        ['<C-U>'] = cmp.mapping.scroll_docs(-4),
        ['<C-D>'] = cmp.mapping.scroll_docs(4),
        ['<TAB>'] = cmp.mapping.select_next_item(),
        ['<S-TAB>'] = cmp.mapping.select_prev_item(),
        ['<DOWN>'] = cmp.mapping.select_next_item(),
        ['<UP>'] = cmp.mapping.select_prev_item(),
        ['<C-E>'] = cmp.mapping.abort(),
        ['<C-C>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),
    },
    snippet = {
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            require 'snippy'.expand_snippet(args.body) -- For `snippy` users.
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'treesitter' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'fish' },
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
                fish = "[fish]",
                nvim_lua = "[lua]",
            },
        },
    },
})

cmp.setup.cmdline('/', {
    completion = { autocomplete = false },
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
