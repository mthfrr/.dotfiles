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
		init = function()
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.nim = {
				install_info = {
					url = "https://github.com/alaviss/tree-sitter-nim",
					files = { "src/parser.c", "src/scanner.cc" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
					-- optional entries:
					branch = "main", -- default branch in case of git repo if different from master
					generate_requires_npm = true, -- if stand-alone parser without npm dependencies
					requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
				},
				filetype = "nim", -- if filetype does not match the parser name
			}
		end,
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
