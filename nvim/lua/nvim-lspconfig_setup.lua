local vim = vim
local servers = require("mason-lspconfig").get_installed_servers()
local lspconfig = require("lspconfig")
local navic = require("nvim-navic")
local cmp = require('cmp_nvim_lsp')

local function lsp_server_on_attach(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end

local function setup_lsp_server_config(server_config)
    server_config.setup {
        on_attach = lsp_server_on_attach,
        capabilities = cmp.default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }
end

for _, server in ipairs(servers) do
    setup_lsp_server_config(lspconfig[server])
end
