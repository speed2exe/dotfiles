-- Setup nvim-cmp.
local cmp = require('cmp')
local lspkind = require('lspkind')
local snippy = require('snippy')
lspkind.init()

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    mapping = {
        ['<C-U>'] = cmp.mapping.scroll_docs(-4),
        ['<C-D>'] = cmp.mapping.scroll_docs(4),
        ["<TAB>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif snippy.can_expand_or_advance() then
                snippy.expand_or_advance()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-TAB>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif snippy.can_jump(-1) then
                snippy.previous()
            else
                fallback()
            end
        end, { "i", "s" }),
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
