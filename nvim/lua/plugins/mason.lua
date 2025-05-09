return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "clojure-lsp",
        "ruby-lsp",
        "eslint-lsp",
        "vtsls",
      },
    },
  },
}
