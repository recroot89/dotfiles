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
    end
  },
  { "isobit/vim-caddyfile" },
  { "tpope/vim-rails" },
  { "tree-sitter/tree-sitter-embedded-template" },
  { "RRethy/nvim-treesitter-endwise" },
  { "dyng/ctrlsf.vim" },
}
