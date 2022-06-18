local aerial = require("aerial")
aerial.setup({
    filter_kind = false,
})

local servers = require("nvim-lsp-installer").get_installed_servers()
local lspconfig = require("lspconfig")

for _, server in ipairs(servers) do
    lspconfig[server.name].setup {
        on_attach = aerial.on_attach,
    }
end
