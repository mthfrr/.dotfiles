return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      c = { "clangtidy" },
      cpp = { "clangtidy" },
      python = { "mypy" }, -- not ruff because it is setup as lsp
      sh = { "shellcheck" },
      nix = { "nix" },
      make = { "checkmake" },
    },
    linters = {
      clangtidy = {
        args = {
          "-checks='clang-analyzer-*,concurrency-*,performance-*,portability-*'",
          "--quiet",
        },
      },
      pylint = {
        args = {
          "-f",
          "json",
          "--disable=R,missing-docstring,invalid-name",
        },
      },
      shellcheck = {
        args = {
          "-x",
          "--format",
          "json",
          "-",
        },
      },
    },
  },
}
