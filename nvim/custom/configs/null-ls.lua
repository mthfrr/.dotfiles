local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins

local sources = {
	b.formatting.trim_whitespace,

	-- webdev stuff
	b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
	b.formatting.prettier.with({ filetypes = { "html", "markdown", "css", "scss" } }), -- so prettier works only on these filetypes

	-- Lua
	b.formatting.stylua,
	b.formatting.clang_format,
	b.formatting.yamlfix,
	b.formatting.black,
	b.formatting.latexindent,
}

-- auto format
local augroup_lspfmt = vim.api.nvim_create_augroup("LspFormatting", {})
local auto_fmt = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup_lspfmt, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup_lspfmt,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end,
		})
	end
end

null_ls.setup({
	debug = true,
	sources = sources,
	on_attach = auto_fmt,
})
