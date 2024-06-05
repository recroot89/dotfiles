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
          on_attach = function(client, bufnr)
            client.server_capabilities.semanticTokensProvider = false
          end,
        },
        ltex = {
          settings = {
            ltex = {
              language = "ru-RU",
            },
          },
        },
      },
    },
  },
}
