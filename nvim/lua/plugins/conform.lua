return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters = opts.formatters or {}
      opts.formatters_by_ft.javascript = { "prettierd" }
      opts.formatters_by_ft.php = { "pint", "tlint" }
      opts.formatters_by_ft.elixir = { "mix_format" }
      opts.formatters_by_ft.eelixir = { "mix_format" }
      opts.formatters_by_ft.heex = { "mix_format" }
      opts.formatters_by_ft.surface = { "mix_format" }
      opts.formatters_by_ft.slim = {
        "trim_whitespace",
        "trim_newlines",
      }
      opts.formatters.mix_format = {
        command = "mix",
        args = { "format", "--no-compile", "--stdin-filename", "$FILENAME", "-" },
        stdin = true,
        cwd = require("conform.util").root_file({ "mix.exs" }),
      }
    end,
  },
}
