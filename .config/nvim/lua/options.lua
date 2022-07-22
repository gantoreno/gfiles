local o = vim.o
local wo = vim.wo

o.number = true
o.showmode = false
o.expandtab = true
o.cursorline = true
o.splitright = true
o.termguicolors = true
o.relativenumber = true

o.cmdheight = 1
o.scrolloff = 10
o.shiftwidth = 2
o.laststatus = 3

o.mouse = "a"
o.listchars = "eol:↴,nbsp:·,space:·,trail:·"
o.background = "dark"
o.clipboard = "unnamedplus"

wo.signcolumn = "yes"
