local g = vim.g
local o = vim.o
local bo = vim.bo
local wo = vim.wo

o.tabstop = 2
o.scrolloff = 10
o.shiftwidth = 2
o.laststatus = 2
o.softtabstop = 0

o.list = false
o.wrap = false
o.hidden = true
o.number = true
o.showcmd = false
o.swapfile = false
o.showmode = false
o.hlsearch = false
o.expandtab = true
o.cursorline = true
o.splitbelow = true
o.errorbells = false
o.smartindent = true

o.listchars = 'eol:↴,nbsp:·,space:·,trail:·'
o.mouse = 'a'
o.encoding = 'UTF-8'
o.clipboard = 'unnamedplus'
o.backspace = 'indent,eol,start'
o.colorcolumn = '9999'
o.completeopt = 'menuone,noinsert,noselect'

wo.number = true
wo.relativenumber = true

wo.signcolumn = 'number'