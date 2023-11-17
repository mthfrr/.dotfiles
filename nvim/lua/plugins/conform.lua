return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      c = { "clang_format" },
      cpp = { "clang_format" },
      css = { { "prettierd", "prettier" } },
      html = { { "prettierd", "prettier" } },
      javascript = { { "prettierd", "prettier" } },
      json = { { "prettierd", "prettier" } },
      latex = { "latexindent" },
      lua = { "stylua" },
      markdown = { { "prettierd", "prettier" } },
      python = { "isort", "black" },
      scss = { { "prettierd", "prettier" } },
      sh = { "shfmt" },
      tex = { "latexindent" },
      toml = { "taplo" },
      typescript = { { "prettierd", "prettier" } },
      yaml = { "yamlfix" },
      zig = { "zigfmt" },
      ["_"] = { "trim_whitespace" },
    },
  },
}