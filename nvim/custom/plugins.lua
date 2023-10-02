local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"https://github.com/nvimdev/guard.nvim",
				config = function()
					require("custom.configs.guard")
				end,
				dependencies = {
					"nvimdev/guard-collection",
				},
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"tpope/vim-eunuch",
		event = "VeryLazy",
	},

	{
		"tpope/vim-surround", -- cs"' ds" ysiw] VS<p class="important">
		event = "VeryLazy",
		dependencies = {
			"tpope/vim-repeat",
		},
	},

	{
		"tpope/vim-speeddating",
		event = "VeryLazy",
		dependencies = {
			"tpope/vim-repeat",
		},
	},

	{
		"tpope/vim-repeat",
		event = "VeryLazy",
	},

	{
		"natecraddock/sessions.nvim",
		cmd = { "SessionsSave", "SessionsLoad", "SessionsStop" },
		config = function()
			require("sessions").setup({
				events = { "VimLeavePre", "VimResume", "VimSuspend" },
				session_filepath = ".session",
			})
		end,
	},

	{
		"dpelle/vim-Grammalecte",
		cmd = { "GrammalecteCheck", "GrammalecteClear" },
		init = function()
			require("custom.configs.grammalecte")
		end,
	},
}

return plugins
