return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "RRethy/nvim-treesitter-endwise" },
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "css",
        "eex",
        "embedded_template",
        "heex",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "php",
        "python",
        "query",
        "regex",
        "ruby",
        "elixir",
        "hcl",
        "terraform",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "slim",
        "go",
        "gomod",
        "gowork",
        "gosum",
      })
      opts.ensure_installed = LazyVim.dedup(opts.ensure_installed)
    end,
  },
}
