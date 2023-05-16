-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.g.lua_snippets_path = vim.fn.stdpath("config") .. "/lua/custom/lua_snippets"

vim.opt.autowrite = true
vim.opt.autoread = true
vim.opt.updatetime = 2000
vim.opt.sessionoptions = "curdir,folds,help,tabpages,winsize,terminal"
vim.opt.spellsuggest = "best,9"
vim.opt.spelllang = "en,fr"

-- Read file changes often
local file_read = vim.api.nvim_create_augroup("file_read", { clear = true })
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI", "VimResume" }, {
	desc = "Reload file if changed on disk",
	group = file_read,
	command = "if mode() != 'c' |checktime|redraw!|  endif",
})
