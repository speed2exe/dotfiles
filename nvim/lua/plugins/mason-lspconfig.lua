return {
	'williamboman/mason-lspconfig.nvim',
	dependencies = { 'williamboman/mason.nvim' },
	config = function()
		require('mason-lspconfig').setup()
		local vim = vim
		local servers = require("mason-lspconfig").get_installed_servers()
		local lspconfig = require("lspconfig")
		local cmp = require('cmp_nvim_lsp')


		local function lsp_server_on_attach(client, bufnr)
			-- currently using treesitter refactor instead
			-- -- https://sbulav.github.io/til/til-neovim-highlight-references/
			-- if client.server_capabilities.documentHighlightProvider then
			-- 	vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
			-- 	vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
			-- 	vim.api.nvim_create_autocmd("CursorHold", {
			-- 		callback = vim.lsp.buf.document_highlight,
			-- 		buffer = bufnr,
			-- 		group = "lsp_document_highlight",
			-- 		desc = "Document Highlight",
			-- 	})
			-- 	vim.api.nvim_create_autocmd("CursorMoved", {
			-- 		callback = vim.lsp.buf.clear_references,
			-- 		buffer = bufnr,
			-- 		group = "lsp_document_highlight",
			-- 		desc = "Clear All the References",
			-- 	})
			-- end

			-- show inlay hints (after version 0.10.0)
			if client.server_capabilities.inlayHintProvider then
				vim.lsp.inlay_hint.enable()
			end

			-- autoformat on save
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_create_augroup("lsp_document_format_on_save", { clear = false })
				vim.api.nvim_create_autocmd("BufWritePre", {
					callback = function() vim.lsp.buf.format() end,
					buffer = bufnr,
					group = "lsp_document_format_on_save",
					desc = "Document Format",
				})
			end
		end

		local function setup_lsp_server_config(server_config)
			server_config.setup {
				capabilities = cmp.default_capabilities(vim.lsp.protocol.make_client_capabilities()),
				on_attach = lsp_server_on_attach,
			}
		end

		for _, server in ipairs(servers) do
			setup_lsp_server_config(lspconfig[server])
		end
	end
}
