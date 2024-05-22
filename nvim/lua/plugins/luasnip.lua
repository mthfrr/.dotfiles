return {

  "L3MON4D3/LuaSnip",
  event = "VeryLazy",
  config = function()
    require("luasnip.loaders.from_lua").lazy_load({ paths = { vim.fn.stdpath("config") .. "/lua_snippets" } })
  end,
  dependencies = {
    {
      "nvim-cmp",
      dependencies = {
        "saadparwaiz1/cmp_luasnip",
      },
      opts = function(_, opts)
        opts.snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        }
        table.insert(opts.sources, { name = "luasnip" })
      end,
    },
  },
}
