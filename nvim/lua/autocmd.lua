vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
        vim.lsp.buf.hover()
	end
})
