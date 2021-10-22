local lspconfig = require('lspconfig')
require'lspinstall'.setup() -- important
local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
    lspconfig[server].setup({})
end
