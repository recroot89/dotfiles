return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        underline = true,
        virtual_text = true,
        float = {
          border = "rounded",
        },
      },
      servers = {
        ruby_lsp = {
          init_options = {
            addonSettings = {
              ["Ruby LSP Rails"] = {
                enablePendingMigrationsPrompt = false,
              },
            },
          },
          on_attach = function(client, bufnr)
            client.server_capabilities.semanticTokensProvider = false
          end,
        },
        clojure_lsp = {},
        ltex = {
          settings = {
            ltex = {
              language = "ru-RU",
            },
          },
        },
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              analyses = {
                fieldalignment = true,
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
              },
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
              directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
              semanticTokens = true,
            },
          },
        },
      },
      setup = {
        gopls = function(_, opts)
          -- workaround for gopls not supporting semanticTokensProvider
          -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
          Snacks.util.lsp.on({ name = "gopls" }, function(client, _)
            if not client.server_capabilities.semanticTokensProvider then
              local caps = (client.config.capabilities or {})
              local semantic = ((caps.textDocument or {}).semanticTokens or {})
              client.server_capabilities.semanticTokensProvider = {
                full = true,
                legend = {
                  tokenTypes = semantic.tokenTypes or {},
                  tokenModifiers = semantic.tokenModifiers or {},
                },
                range = true,
              }
            end
          end)
          -- end workaround
        end,
      },
    },
  },
}
