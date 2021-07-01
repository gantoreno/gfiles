require('plugins')

-- Map space to no-op
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})

-- Set space as leader
vim.g.mapleader = ' '
