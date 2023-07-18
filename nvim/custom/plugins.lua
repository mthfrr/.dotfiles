local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
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
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},

	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
		},
	},

	{
		"mfussenegger/nvim-dap",
		config = function(_, _)
			require("core.utils").load_mappings("dap")
		end,
	},
}

return plugins
