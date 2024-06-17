vim.g.mapleader = " "

vim.o.relativenumber = true
vim.o.number = true

--opts
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

vim.api.nvim_set_keymap("i", "jk", "<ESC>", {noremap = true})


require("nyg.plugins-setup")
