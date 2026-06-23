return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "phpstan",
        "pint",
        "tlint",
        "stylua",
        "shellcheck",
        "shfmt",
        "phpactor",
        "clojure-lsp",
        "elixir-ls",
        "tailwindcss-language-server",
        "eslint-lsp",
        "vtsls",
        -- "flake8",
      })
    end,
  },
}
