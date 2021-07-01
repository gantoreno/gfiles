local g = vim.g
local set_keymap = vim.api.nvim_set_keymap

-- Map space to no-op
set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})

-- Set space as leader
g.mapleader = ' '

set_keymap('n', '<Leader>nn', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

set_keymap('n', '<Leader>wsus', ':!workspace up -s<CR><CR>', {silent = true})
set_keymap('n', '<Leader>wsud', ':!workspace up -d<CR><CR>', {silent = true})
set_keymap('n', '<Leader>wsue', ':!workspace up -e<CR><CR>', {silent = true})
