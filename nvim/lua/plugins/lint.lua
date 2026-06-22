return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      events = { "BufWritePost" },
      linters_by_ft = {
        slim = { "slim_lint" },
      },
      linters = {
        slim_lint = {
          cmd = "slim-lint",
          stdin = true,
          append_fname = false,
          args = {
            "--stdin-file-path",
            function()
              return vim.api.nvim_buf_get_name(0)
            end,
            "--no-color",
            "-",
          },
          stream = "stdout",
          ignore_exitcode = true,
          parser = require("lint.parser").from_pattern(
            "^([^:]+):(%d+) %[(%w)%] (.+)$",
            { "file", "lnum", "severity", "message" },
            {
              E = vim.diagnostic.severity.ERROR,
              W = vim.diagnostic.severity.WARN,
              I = vim.diagnostic.severity.INFO,
            },
            { source = "slim-lint" }
          ),
        },
      },
    },
  },
}
