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
set_keymap("n", "<space>", "<nop>", { noremap = true, silent = true })

g.mapleader = " "
-- }}}

-- Please learn to use hjkl {{{
set_keymap("", "<up>", "<nop>", { noremap = true, silent = true })
set_keymap("", "<down>", "<nop>", { noremap = true, silent = true })
set_keymap("", "<left>", "<nop>", { noremap = true, silent = true })
set_keymap("", "<right>", "<nop>", { noremap = true, silent = true })
-- }}}

-- Keymaps {{{
set_keymap("", "<leader>cc", ":TComment<cr>", { noremap = true, silent = true })
set_keymap("", "<leader>nn", ":NvimTreeToggle<cr>", { noremap = true, silent = true })
set_keymap("", "<leader>hh", ":ColorizerToggle<cr>", { noremap = true, silent = true })
set_keymap("", "<leader>pp", ":MarkdownPreview<cr>", { noremap = true, silent = true })
set_keymap("", "<leader>ff", ":Telescope find_files hidden=true<cr>", { noremap = true, silent = true })
set_keymap("", "<leader>spt", ":FloatermNew spt<cr>", { noremap = true, silent = true })
set_keymap("", "<leader>lzg", ":FloatermNew lazygit<cr>", { noremap = true, silent = true })

set_keymap("", "<leader>tt", ":tabnew<cr>", { noremap = true, silent = true })
set_keymap("", "<leader><left>", ":tabprev<cr>", { noremap = true, silent = true })
set_keymap("", "<leader><right>", ":tabnext<cr>", { noremap = true, silent = true })

set_keymap("", "<leader>wsus", ":!workspace up --single<cr><cr>", { silent = true })
set_keymap("", "<leader>wsud", ":!workspace up --double<cr><cr>", { silent = true })
set_keymap("", "<leader>wsut", ":!workspace up --triple<cr><cr>", { silent = true })
set_keymap("", "<leader>wsd", ":!workspace down<cr><cr>", { silent = true })
-- }}}
