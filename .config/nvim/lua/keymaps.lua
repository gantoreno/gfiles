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
set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})

g.mapleader = ' '
-- }}}

-- Keymaps {{{
set_keymap('', '<Leader>cc', ':TComment<CR>', {noremap = true, silent = true})
set_keymap('', '<Leader>nn', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
set_keymap('', '<Leader>ff', ':Telescope find_files<CR>', {noremap = true, silent = true})

set_keymap('', '<Leader>wsus', ':!workspace up -s<CR><CR>', {silent = true})
set_keymap('', '<Leader>wsud', ':!workspace up -d<CR><CR>', {silent = true})
set_keymap('', '<Leader>wsue', ':!workspace up -e<CR><CR>', {silent = true})
-- }}}
