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

-- more keybinds!

return M
