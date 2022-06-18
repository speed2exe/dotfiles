local lsp_status = require('lsp-status')
lsp_status.register_progress()

-- lsp_status.config.capabilities = vim.tbl_extend('keep', lsp_status.config.capabilities or {}, lsp_status.capabilities)

local lspconfig = require('lspconfig')
local servers = require("nvim-lsp-installer").get_installed_servers()

for _, server in ipairs(servers) do
    lspconfig[server.name].setup {
        on_attach = lsp_status.on_attach,
        capabilities = lsp_status.capabilities,
    }
end
