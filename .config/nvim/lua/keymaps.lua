--    ______      __         _      __   Gabriel Moreno
--   / ____/___ _/ /_  _____(_)__  / /   ==============
--  / / __/ __ `/ __ \/ ___/ / _ \/ /    E-mail:   gantoreno@gmail.com
-- / /_/ / /_/ / /_/ / /  / /  __/ /     Website:  https://gantoreno.com
-- \____/\__,_/_.___/_/  /_/\___/_/      GitHub:   https://github.com/gantoreno
-- 
-- Neovim keymaps file

-- Variables {{{
local g = vim.g
local set_keymap = vim.api.nvim_set_keymap
-- }}}

-- Leader {{{
set_keymap('n', '<space>', '<nop>', {noremap = true, silent = true})

g.mapleader = ' '
-- }}}

-- Keymaps {{{
set_keymap('', '<leader>cc', ':TComment<cr>', {noremap = true, silent = true})
set_keymap('', '<leader>nn', ':NvimTreeToggle<cr>', {noremap = true, silent = true})
set_keymap('', '<leader>ff', ':Telescope find_files<cr>', {noremap = true, silent = true})

set_keymap('', '<leader>wsus', ':!workspace up -s<cr><cr>', {silent = true})
set_keymap('', '<leader>wsud', ':!workspace up -d<cr><cr>', {silent = true})
set_keymap('', '<leader>wsue', ':!workspace up -e<cr><cr>', {silent = true})
-- }}}
