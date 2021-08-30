--    ______      __         _      __   Gabriel Moreno
--   / ____/___ _/ /_  _____(_)__  / /   ==============
--  / / __/ __ `/ __ \/ ___/ / _ \/ /    E-mail:   gantoreno@gmail.com
-- / /_/ / /_/ / /_/ / /  / /  __/ /     Website:  https://gantoreno.com
-- \____/\__,_/_.___/_/  /_/\___/_/      GitHub:   https://github.com/gantoreno
--
-- Neovim options file

-- Variables {{{
local o = vim.o
local wo = vim.wo
-- }}}

-- Options {{{
o.tabstop = 2
o.scrolloff = 10
o.shiftwidth = 2
o.laststatus = 2
o.softtabstop = 0

o.list = false
o.wrap = true
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

o.shortmess = o.shortmess .. "I"
o.splitright = true
o.mouse = "a"
o.encoding = "UTF-8"
o.clipboard = "unnamedplus"
o.backspace = "indent,eol,start"
o.shortmess = o.shortmess .. "c"
o.listchars = "eol:↴,nbsp:·,space:·,trail:·"
o.foldmethod = "marker"
o.colorcolumn = "9999"
o.completeopt = "menuone,noinsert,noselect"
-- }}}

-- Window options {{{
wo.number = true
wo.relativenumber = true

wo.signcolumn = "yes"
-- }}}
