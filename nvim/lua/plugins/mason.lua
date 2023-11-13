return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- lint
      -- "pylint", -- not autoinstall since pylint in mason doesn't see libraries
      "shellcheck",
      -- seveur
      "clangd",
      "ltex-ls",
      "lua-language-server",
      "nil",
      "pyright",
      "tectonic",
      "texlab",
      "zls",
      -- format
      "black",
      "clang-format",
      "isort",
      "prettierd",
      "shfmt",
      "stylua",
      "taplo",
      "yamlfix",
    },
  },
}
