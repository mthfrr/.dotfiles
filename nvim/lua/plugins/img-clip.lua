return {
  "HakonHarnes/img-clip.nvim",
  -- event = "VeryLazy",
  opts = {
    -- add options here
    -- or leave it empty to use the default settings
  },
  cmd = {
    "PasteImage",
    "ImgClipDebug",
    "ImgClipConfig",
  },
  keys = {
    -- suggested keymap
    { "<leader>i", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
