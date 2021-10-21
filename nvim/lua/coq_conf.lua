local lsp = require "lspconfig"
protocol = require'vim.lsp.protocol'
local coq = require "coq" -- add this
lsp.gopls.setup(coq.lsp_ensure_capabilities({})) -- after  



