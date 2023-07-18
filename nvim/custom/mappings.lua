---@type MappingsTable
local M = {}

M.general = {
	n = {
		["<leader>y"] = { '"+y', "yank to system clipboard" },

		["<leader>p"] = { '"+p', "paste from system clipboard" },
		["<leader>P"] = { '"+P', "paste from system clipboard" },
	},
	v = {
		["<leader>y"] = { '"+y', "yank to system clipboard" },
		["<leader>Y"] = { '"+yg_', "yank to system clipboard" },

		["<leader>p"] = { '"+p', "paste from system clipboard" },
		["<leader>P"] = { '"+P', "paste from system clipboard" },
	},
}

M.telescope = {
	n = {
		["<leader>fs"] = { "<cmd> Telescope lsp_dynamic_workspace_symbols <CR>", "Find symbol" },
	},
}

M.dap = {
	plugin = true,
	n = {
		["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "Breakpoint toggle at line" },
		["<leader>dr"] = { "<cmd> DapContinue <CR>", "Start or continue the debugger" },
	},
}

-- more keybinds!

return M
