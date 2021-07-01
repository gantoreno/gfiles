local g = vim.g
local o = vim.o
local bo = vim.wo
local wo = vim.wo
local command = vim.api.nvim_command
local set_option = vim.api.nvim_set_option
local win_set_option = vim.api.nvim_win_set_option

require('plugins')
require('colors')
require('keymaps')

bo.signcolumn = 'number'

wo.number = true
wo.relativenumber = true

g.nvim_tree_auto_close = 1
g.nvim_tree_update_cwd = 1
g.nvim_tree_quit_on_open = 1
g.nvim_tree_indent_markers = 0
