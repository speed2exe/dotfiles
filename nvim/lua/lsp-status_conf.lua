local lsp_status = require('lsp-status')
lsp_status.register_progress()

local lsp_status = require('lsp-status')
for _, server in pairs(servers) do
    lspconfig[server].setup({
        handers = lsp_status.extensions[server].setup(),
        on_attach = lsp_status.on_attach,
        capabilities = lsp_status.capabilities,
    })
end

