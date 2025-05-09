return {
  {
    "Olical/conjure",
    ft = { "clojure" },
    config = function()
      vim.g["conjure#log#hud#enabled"] = true
      vim.g["conjure#log#hud#anchor"] = "SE"
      vim.g["conjure#client#clojure#nrepl#eval#auto_require"] = false
      vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "clojure",
        callback = function()
          -- Evaluation mappings
          vim.keymap.set(
            "n",
            "<localleader>e",
            ":ConjureEvalCurrentForm<CR>",
            { buffer = true, desc = "Evaluate current form" }
          )
          vim.keymap.set("n", "<localleader>b", ":ConjureEvalBuffer<CR>", { buffer = true, desc = "Evaluate buffer" })
          vim.keymap.set(
            "n",
            "<localleader>r",
            ":ConjureEvalRootForm<CR>",
            { buffer = true, desc = "Evaluate root form" }
          )

          -- REPL interaction
          vim.keymap.set("n", "<localleader>c", ":ConjureConnect<CR>", { buffer = true, desc = "Connect to REPL" })
          vim.keymap.set("n", "<localleader>n", ":ConjureReload<CR>", { buffer = true, desc = "Reload namespace" })
          vim.keymap.set("n", "<localleader>l", ":ConjureLogToggle<CR>", { buffer = true, desc = "Toggle REPL log" })

          -- Documentation and navigation
          vim.keymap.set("n", "K", ":ConjureDocWord<CR>", { buffer = true, desc = "Show documentation" })
          vim.keymap.set("n", "<localleader>gd", ":ConjureDefWord<CR>", { buffer = true, desc = "Go to definition" })
        end,
      })
    end,
  },
  {
    "guns/vim-sexp",
    ft = { "clojure" },
    dependencies = {
      "tpope/vim-sexp-mappings-for-regular-people",
    },
  },
  {
    "clojure-vim/vim-jack-in",
    ft = { "clojure" },
  },
}
