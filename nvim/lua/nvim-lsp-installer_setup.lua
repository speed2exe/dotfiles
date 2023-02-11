local vim = vim
local servers = require("nvim-lsp-installer").get_installed_servers()
local lspconfig = require("lspconfig")
local navic = require("nvim-navic")
local cmp = require('cmp_nvim_lsp')

for _, server in ipairs(servers) do
    lspconfig[server.name].setup {
        on_attach = function(client, bufnr) navic.attach(client, bufnr) end,
        capabilities = cmp.update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }
end

vim.cmd [[
    autocmd CursorHold  <buffer> silent! lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved <buffer> silent! lua vim.lsp.buf.clear_references()
]]
