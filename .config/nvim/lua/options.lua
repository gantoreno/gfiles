local g = vim.g
local o = vim.o

-- Options
o.cursorline = true
o.expandtab = true
o.hidden = true
o.hlsearch = false
o.number = true
o.relativenumber = true
o.showmode = false
o.splitbelow = true
o.splitright = true
o.termguicolors = true

o.so = 15
o.laststatus = 3
o.showtabline = 2
o.shiftwidth = 2
o.cmdheight = 1

o.backspace = 'indent,eol,start'
o.clipboard = 'unnamedplus'
o.signcolumn = 'number'
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'

o.mouse = o.mouse .. 'a'
o.shortmess = o.shortmess .. 'astWAIc'

-- Globals
g.mapleader = ' '


-- Extra plugin options
g.floaterm_borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' }
g.floaterm_shell = 'NEOVIM=1 /usr/bin/env zsh'
g.floaterm_height = 0.25
g.floaterm_autoclose = 1
g.floaterm_wintype = 'split'
g.floaterm_position = 'botright'
g.floaterm_keymap_toggle = '<C-s>'

g.signify_sign_add = '┃'
g.signify_sign_delete = '▸'
g.signify_sign_change = '┃'
g.signify_sign_changedelete = '┃'
g.signify_sign_delete_first_line = '┃'
g.signify_sign_show_count = 0
