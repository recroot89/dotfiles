-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.langmap =
  "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

vim.o.relativenumber = false
vim.o.spelllang = "ru_ru,en_us"
vim.o.linebreak = true
vim.g.autoformat = false
vim.g.snacks_animate = false
vim.g.maplocalleader = ","

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.b.autoformat = true
  end,
})

vim.g.root_spec = { "cwd" }

vim.filetype.add({
  extension = {
    slim = "slim",
  },
})
