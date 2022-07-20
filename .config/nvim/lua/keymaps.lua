local g = vim.g
local set_keymap = vim.api.nvim_set_keymap

set_keymap("n", "<space>", "<nop>", { noremap = true, silent = true })

g.mapleader = " "

set_keymap("", "<leader>nn", ":NvimTreeToggle<cr>", { noremap = true, silent = true })

