local vim = vim
local servers = require("mason-lspconfig").get_installed_servers()
local lspconfig = require("lspconfig")
local navic = require("nvim-navic")
local cmp = require('cmp_nvim_lsp')

for _, server in ipairs(servers) do
    lspconfig[server].setup {
        root_dir = lspconfig.util.root_pattern('.git'),
        on_attach = function(client, bufnr)
            navic.attach(client, bufnr)

            -- https://sbulav.github.io/til/til-neovim-highlight-references/
            if client.server_capabilities.documentHighlightProvider then
                vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
                vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
                vim.api.nvim_create_autocmd("CursorHold", {
                    callback = vim.lsp.buf.document_highlight,
                    buffer = bufnr,
                    group = "lsp_document_highlight",
                    desc = "Document Highlight",
                })
                vim.api.nvim_create_autocmd("CursorMoved", {
                    callback = vim.lsp.buf.clear_references,
                    buffer = bufnr,
                    group = "lsp_document_highlight",
                    desc = "Clear All the References",
                })
            end

            -- autoformat on save
            vim.api.nvim_create_autocmd("BufWritePre", {
                callback = function() vim.lsp.buf.format() end,
                buffer = bufnr,
                group = "lsp_document_format",
                desc = "Document Format",
            })
        end,
        capabilities = cmp.default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }
end
