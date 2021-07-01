local g = vim.g
local set_keymap = vim.api.nvim_set_keymap

set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})

g.mapleader = ' '

set_keymap('n', '<Leader>cc', ':TComment<CR>', {noremap = true, silent = true})
set_keymap('n', '<Leader>nn', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
set_keymap('n', '<Leader>ff', ':Telescope find_files<CR>', {noremap = true, silent = true})

set_keymap('n', '<Leader>wsus', ':!workspace up -s<CR><CR>', {silent = true})
set_keymap('n', '<Leader>wsud', ':!workspace up -d<CR><CR>', {silent = true})
set_keymap('n', '<Leader>wsue', ':!workspace up -e<CR><CR>', {silent = true})
