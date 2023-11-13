return {
  "L3MON4D3/LuaSnip",
  init = function(_)
    require("luasnip.loaders.from_lua").lazy_load({ paths = vim.fn.stdpath("config") .. "/lua_snippets" })
  end,
}
