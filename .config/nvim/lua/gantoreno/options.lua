local g = vim.g
local o = vim.o

-- Options
o.cursorline = true
o.expandtab = true
o.hidden = true
o.hlsearch = false
o.number = true
o.relativenumber = false
o.showmode = false
o.splitbelow = true
o.splitright = true
o.termguicolors = true

o.so = 15
o.laststatus = 3
o.showtabline = 1
o.shiftwidth = 2
o.cmdheight = 1

o.backspace = 'indent,eol,start'
o.clipboard = 'unnamedplus'
o.signcolumn = 'yes'
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'

o.mouse = o.mouse .. 'a'
o.shortmess = o.shortmess .. 'astWAIc'

-- Globals
g.mapleader = ' '
