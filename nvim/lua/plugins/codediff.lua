return {
  {
    "esmuellert/codediff.nvim",
    version = "*",
    cmd = "CodeDiff",
    keys = {
      { "<leader>gv", "<cmd>CodeDiff<cr>", desc = "Git Diff Viewer" },
      { "<leader>gV", "<cmd>CodeDiff history %<cr>", desc = "Git File History (CodeDiff)" },
    },
    opts = {
      keymaps = {
        view = { show_help = { "h", "g?" } },
        explorer = { select = "o" },
      },
    },
  },
}
