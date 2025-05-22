return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("fzf-lua").setup({
        winopts = {
          height = 0.85,
          width = 0.80,
          preview = {
            default = "bat", -- preview
          },
        },
        fzf_opts = {
          ["--layout"] = "reverse",
          ["--info"] = "inline",
        },
        grep = {
          cmd = "rg --vimgrep --smart-case --column --line-number",
          input_prompt = "Grep > ",
          actions = {
            ["default"] = require("fzf-lua.actions").file_edit,
          },
        },
        files = {
          prompt = "Files > ",
          actions = {
            ["default"] = require("fzf-lua.actions").file_edit,
          },
        },
      })
    end,
  },
}
