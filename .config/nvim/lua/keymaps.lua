local g = vim.g
local set_keymap = vim.api.nvim_set_keymap

set_keymap("n", "<space>", "<nop>", { noremap = true, silent = true })

g.mapleader = " "

set_keymap("", "<leader>cc", ":TComment<cr>", { noremap = true, silent = true })
set_keymap("", "<leader>nn", ":NvimTreeToggle<cr>", { noremap = true, silent = true })
set_keymap("", "<leader>ff", ":Telescope find_files<cr>", { noremap = true, silent = true })

set_keymap("", "<leader>lzg", ":FloatermNew --wintype=float --width=0.8 --height=0.8 --position=center lazygit<CR>",
  { noremap = true, silent = true })
set_keymap("", "<leader>glg",
  ":FloatermNew --wintype=float --width=0.8 --height=0.8 --position=center git log --graph<CR>",
  { noremap = true, silent = true })

set_keymap("n", "<C-h>", "<C-\\><C-n><C-w>h", { noremap = true, silent = true })
set_keymap("n", "<C-j>", "<C-\\><C-n><C-w>j", { noremap = true, silent = true })
set_keymap("n", "<C-k>", "<C-\\><C-n><C-w>k", { noremap = true, silent = true })
set_keymap("n", "<C-l>", "<C-\\><C-n><C-w>l", { noremap = true, silent = true })

set_keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", { noremap = true, silent = true })
set_keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", { noremap = true, silent = true })
set_keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", { noremap = true, silent = true })
set_keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", { noremap = true, silent = true })

set_keymap("n", "L", ":Lspsaga show_line_diagnostics<cr>", { silent = true, noremap = true })
