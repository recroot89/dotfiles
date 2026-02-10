return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}, -- this is equalent to setup({}) function
  },
  {
    "Wansmer/treesj",
    keys = {
      { "<leader>j", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
    },
    opts = { use_default_keymaps = false, max_join_length = 150 },
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
    config = true,
  },
  { "isobit/vim-caddyfile" },
  { "tpope/vim-rails" },
  { "tree-sitter/tree-sitter-embedded-template" },
  { "nvim-treesitter/nvim-treesitter-context" },
  { "RRethy/nvim-treesitter-endwise" },
  { "dyng/ctrlsf.vim" },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      code = {
        enabled = false,
        -- sign = true,
      },
    },
  },
}
