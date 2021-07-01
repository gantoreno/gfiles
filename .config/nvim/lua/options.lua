local g = vim.g
local o = vim.o
local bo = vim.wo
local wo = vim.wo
local command = vim.api.nvim_command
local set_option = vim.api.nvim_set_option
local win_set_option = vim.api.nvim_win_set_option

o.tabstop = 2
o.scrolloff = 10
o.shiftwidth = 2
o.laststatus = 2
o.softtabstop = 0

o.expandtab = true

o.mouse = 'a'
o.encoding = 'UTF-8'
o.clipboard = 'unnamedplus'
o.colorcolumn = '9999'

bo.signcolumn = 'number'

wo.number = true
wo.relativenumber = true
