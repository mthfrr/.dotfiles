return {
  {
    "vxpm/ferris.nvim",
    ft = "rust",
    opts = {},
  },

  {
    "saecki/crates.nvim",
    tag = "stable",
    config = function()
      require("crates").setup()
    end,
  },
}
