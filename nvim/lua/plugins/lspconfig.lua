return {
  "neovim/nvim-lspconfig",
  opts = {
    setup = {
      clangd = function(_, opts)
        opts.capabilities.offsetEncoding = { "utf-8" }
        opts.cmd = { "clangd", "--header-insertion=never", "--background-index", "--clang-tidy", "--log=verbose" }
      end,
      zls = function(_, opts)
        opts.enable_inlay_hints = true
        opts.use_comptime_interpreter = true
      end,
      textlab = function(_, opts)
        opts.settings.textlab = {
          auxDirectory = ".",
          bibtexFormatter = "texlab",
          build = {
            args = {
              "-X",
              "compile",
              "%f",
              "--synctex",
              "--keep-logs",
              "--keep-intermediates",
            },
            executable = "tectonic",
          },
          diagnosticsDelay = 300,
        }
      end,
      ltex = function(_, opts)
        opts.settings = { ltex = { language = "fr" } }
      end,
    },
  },
}
