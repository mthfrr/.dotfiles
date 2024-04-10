return {
  {
    "vhyrro/luarocks.nvim",
    opts = {
      rocks = { "magick" },
    },
  },
  {
    "3rd/image.nvim",
    dependencies = { "vhyrro/luarocks.nvim" },
    opts = {},
    events = "VeryLazy",
  },
}
