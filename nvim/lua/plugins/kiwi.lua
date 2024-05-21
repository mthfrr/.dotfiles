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
    {
      name = "rrr",
      path = "/home/pol/rrr/notes",
    },
  },
  keys = {
    { "<leader>kk", ':lua require("kiwi").open_wiki_index("wiki")<cr>', desc = "Open Wiki index" },
    { "<leader>kr", ':lua require("kiwi").open_wiki_index("rrr")<cr>', desc = "Open Wiki index" },
    { "T", ':lua require("kiwi").todo.toggle()<cr>', desc = "Toggle Markdown Task", ft = "markdown" },
  },
}
