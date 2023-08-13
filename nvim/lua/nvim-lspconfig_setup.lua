local vim = vim
local servers = require("mason-lspconfig").get_installed_servers()
local lspconfig = require("lspconfig")
local cmp = require('cmp_nvim_lsp')

local function setup_lsp_server_config(server_config)
    server_config.setup {
        capabilities = cmp.default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }
end

for _, server in ipairs(servers) do
    setup_lsp_server_config(lspconfig[server])
end
