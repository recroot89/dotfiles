return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "phpstan",
        "pint",
        "tlint",
        "stylua",
        "shellcheck",
        "shfmt",
        "clojure-lsp",
        "ruby-lsp",
        "eslint-lsp",
        "vtsls",
        -- "flake8",
      },
    },
  },
}
