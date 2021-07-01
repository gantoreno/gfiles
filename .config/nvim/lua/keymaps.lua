-- Map space to no-op
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})

-- Set space as leader
vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', '<Leader>nn', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<Leader>wsus', ':!workspace up -s<CR><CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>wsud', ':!workspace up -d<CR><CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>wsue', ':!workspace up -e<CR><CR>', {silent = true})
