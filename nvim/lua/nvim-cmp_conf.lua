-- Setup nvim-cmp.
local cmp = require('cmp')
local lspkind = require('lspkind')
lspkind.init()

cmp.setup({
    mapping = {
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-c>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm(),
        ['<TAB>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        ['<S-TAB>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'fish' },
        { name = 'treesitter' },
        { name = 'nvim_lua' },
        { name = 'path' },
        { name = 'snippy' },
        { name = 'buffer'},
        { name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lsp_document_symbol' },
        { name = 'calc' },
        { name = 'dictionary' },
        { name = 'digraphs' },
    },
    snippet = {
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            require'snippy'.expand_snippet(args.body) -- For `snippy` users.
        end,
    },
    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
                nvim_lsp = "[LSP]",
                fish = "[fish]",
                treesitter = "[TS]",
                nvim_lua = "[lua]",
                path = "[path]",
                snippy = "[snip]",
                buffer = "[buf]",
                nvim_lsp_signature_help = "[signature]",
                nvim_lsp_document_symbol = "[symbol]",
                calc = "[math]",
                dictionary = "[dict]",
                digraphs = "[digraphs]",
            },
        },
    },
    experimental = {
        native_menu = false,
        ghost_text = true,
    }
})

-- Setup lspconfig.
local servers = require'nvim-lsp-installer'.get_installed_servers()
for _, server in pairs(servers) do
    require('lspconfig')[server['name']].setup {
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }
end
