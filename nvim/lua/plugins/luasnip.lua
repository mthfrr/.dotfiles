return {
  "L3MON4D3/LuaSnip",
  event = "VeryLazy",
  config = function()
    require("luasnip.loaders.from_lua").lazy_load({ paths = { vim.fn.stdpath("config") .. "/lua_snippets" } })
  end,
}
