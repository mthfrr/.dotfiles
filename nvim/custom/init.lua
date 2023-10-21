local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

vim.g.lua_snippets_path = vim.fn.stdpath("config") .. "/lua/custom/lua_snippets"
vim.g.c_syntax_for_h = 1

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.list = true
vim.opt.listchars = "tab:>-,trail:."
vim.opt.expandtab = true
vim.opt.clipboard = ""
vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.updatetime = 2000
vim.opt.sessionoptions = "curdir,folds,help,tabpages,winsize,terminal"

vim.g.spellfile_URL = "https://ftp.nluug.nl/vim/runtime/spell"
vim.opt.spellsuggest = "best,9"
vim.opt.spelllang = "en,fr"

vim.diagnostic.config({ severity_sort = true })

-- Read file changes often
local file_read = augroup("file_read", { clear = true })
autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI", "VimResume" }, {
	desc = "Reload file if changed on disk",
	group = file_read,
	command = "if mode() != 'c' |checktime|redraw!|  endif",
})
