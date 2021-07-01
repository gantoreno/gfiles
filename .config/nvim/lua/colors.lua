local g = vim.g
local o = vim.o
local command = vim.api.nvim_command

g.startrail_italic_comments = false
g.startrail_italic_functions = false

command('colorscheme startrail')

o.termguicolors = true
