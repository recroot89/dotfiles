-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local bind = vim.keymap.set
local opts = { silent = true, noremap = true }

-- for russian layout
bind("i", "<c-х>", "<C-[>", opts)
bind("n", "о", "gj", opts)
bind("n", "л", "gk", opts)
bind("i", "<C-г>", "<C-G>u<C-U>", opts)
bind("i", "<C-ц>", "<C-G>u<C-W>", opts)

bind("n", "<leader>[", "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>", { desc = "Insert line above" })
bind("n", "<leader>]", "<Cmd>call append(line('.'),     repeat([''], v:count1))<CR>", { desc = "Insert line below" })

bind("n", "<leader>m", "<cmd>MCPHub<CR>", { desc = "Open MCP Hub" })
