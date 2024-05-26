return {
  "monaqa/dial.nvim",
  keys = {
    {
      "<C-A>",
      function()
        require("dial.map").manipulate("increment", "normal")
      end,
      desc = "Increment",
    },
    {
      "<C-X",
      function()
        require("dial.map").manipulate("decrement", "normal")
      end,
      desc = "Decrement",
    },
  },
}
