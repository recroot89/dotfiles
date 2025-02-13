return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "ruby-lsp",
        "eslint-lsp",
        "vtsls",
      },
    },
  },
}
