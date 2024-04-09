return {
  "serenevoid/kiwi.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  lazy = true,
  opts = {
    {
      name = "wiki",
      path = "/home/pol/wiki",
    },
  },
  keys = {
    { "<leader>k", ':lua require("kiwi").open_wiki_index()<cr>', desc = "Open Wiki index" },
    { "T", ':lua require("kiwi").todo.toggle()<cr>', desc = "Toggle Markdown Task" },
  },
}
