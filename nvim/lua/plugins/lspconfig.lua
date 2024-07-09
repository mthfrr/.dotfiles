return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ruff = { mason = false },
    },
    ---@type table<string, fun(server:string, opts):boolean?>
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
            executable = "tectonic",
            args = {
              "-X",
              "compile",
              "%f",
              "--synctex",
              "--keep-logs",
              "--keep-intermediates",
            },
          },
          diagnosticsDelay = 300,
        }
      end,
      ltex = function(_, opts)
        opts.settings = {
          ltex = {
            language = "en",
            additionalRules = { enablePickyRules = true, motherTongue = "fr" },
            languageToolHttpServerUri = "http://127.0.0.1:8081",
          },
        }
      end,
    },
  },
}
