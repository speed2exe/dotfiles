-- Setup nvim-cmp.
local cmp = require('cmp')
local lspkind = require('lspkind')
lspkind.init()

cmp.setup({
    mapping = {
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'treesitter' },
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'buffer'},
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[api]",
                path = "[path]",
                luasnip = "[snip]",
                treesitter = "[TS]",
            },
        },
    },
    experimental = {
        native_menu = false,
        ghost_text = true,
    }
})

-- Setup lspconfig.
local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
    require('lspconfig')[server].setup {
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }
end


