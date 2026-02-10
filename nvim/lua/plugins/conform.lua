return {
  "stevearc/conform.nvim",
  formatters_by_ft = {
    javascript = { "prettierd" },
    php = {
      "pint",
      "tlint",
    },
  },
  -- event = { "BufWritePre" },
  --
  -- opts = {
  --   default_format_opts = {
  --     lsp_format = "fallback",
  --   },
  -- },
  --
  -- init = function()
  --   vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  -- end,
}
