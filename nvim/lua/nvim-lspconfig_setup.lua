local vim = vim
local servers = require("mason-lspconfig").get_installed_servers()
local lspconfig = require("lspconfig")
local navic = require("nvim-navic")
local cmp = require('cmp_nvim_lsp')

for _, server in ipairs(servers) do
    lspconfig[server].setup {
        on_attach = navic.attach,
        capabilities = cmp.default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }
end
