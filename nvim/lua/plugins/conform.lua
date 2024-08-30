return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      asm = { "asmfmt" },
      nasm = { "asmfmt" },
      c = { "clang_format" },
      cpp = { "clang_format" },
      css = { "prettierd", "prettier", stop_after_first = true },
      html = { { "prettierd", "prettier" } },
      javascript = { { "prettierd", "prettier" } },
      json = { { "prettierd", "prettier" } },
      latex = { "latexindent" },
      lua = { "stylua" },
      markdown = { { "prettierd", "prettier" } },
      python = function(bufnr)
        if require("conform").get_formatter_info("ruff_format", bufnr).available then
          return { "ruff_format" }
        else
          return { "isort", "black" }
        end
      end,
      scss = { { "prettierd", "prettier" } },
      sh = { "shfmt" },
      tex = { "latexindent" },
      toml = { "taplo" },
      typescript = { { "prettierd", "prettier" } },
      typst = { "typstfmt" },
      yaml = { { "prettierd", "prettier" } },
      rust = { "rustfmt" },
      zig = { "zigfmt" },
      xml = { "xmlformat" },
      ["_"] = { "trim_whitespace" },
    },
  },
}
