local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "pyright" }

local my_on_attach = function(client, bufnr)
	on_attach(client, bufnr)

	-- Highlight if cursor hovers
	if client.server_capabilities.documentHighlightProvider then
		vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
		vim.api.nvim_clear_autocmds({ buffer = bufnr, group = "lsp_document_highlight" })
		vim.api.nvim_create_autocmd({ "CursorHold" }, {
			callback = vim.lsp.buf.document_highlight,
			buffer = bufnr,
			group = "lsp_document_highlight",
			desc = "Document Highlight",
		})
		vim.api.nvim_create_autocmd("CursorMoved", {
			callback = vim.lsp.buf.clear_references,
			buffer = bufnr,
			group = "lsp_document_highlight",
			desc = "Clear All the References",
		})
	end
end

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = my_on_attach,
		capabilities = capabilities,
	})
end

lspconfig.clangd.setup({
	on_attach = my_on_attach,
	capabilities = vim.tbl_deep_extend("force", capabilities, { offsetEncoding = "utf-8" }),
	cmd = { "clangd", "--header-insertion=never", "--background-index", "--clang-tidy", "--log=verbose" },
})

lspconfig.zls.setup({
	on_attach = my_on_attach,
	capabilities = capabilities,
	enable_inlay_hints = true,
	use_comptime_interpreter = true,
})
