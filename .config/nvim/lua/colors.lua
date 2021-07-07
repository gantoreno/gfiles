--    ______      __         _      __   Gabriel Moreno
--   / ____/___ _/ /_  _____(_)__  / /   ==============
--  / / __/ __ `/ __ \/ ___/ / _ \/ /    E-mail:   gantoreno@gmail.com
-- / /_/ / /_/ / /_/ / /  / /  __/ /     Website:  https://gantoreno.com
-- \____/\__,_/_.___/_/  /_/\___/_/      GitHub:   https://github.com/gantoreno
--
-- Neovim colors file

-- Commands {{{
local g = vim.g
local o = vim.o
local command = vim.api.nvim_command
local highlight = vim.highlight
-- }}}

-- Startrail theme {{{
g.startrail_italic_comments = false
g.startrail_italic_functions = false

command("colorscheme startrail")
-- }}}

-- Truecolors {{{
o.termguicolors = true
-- }}}

-- LSP custom highlights {{{
command("autocmd VimEnter * highlight LspDiagnosticsDefaultError guifg=#fe9f7c")
command("autocmd VimEnter * highlight LspDiagnosticsDefaultWarning guifg=#e8aa6e")
command("autocmd VimEnter * highlight LspDiagnosticsDefaultInformation guifg=#7dc2c7")
command("autocmd VimEnter * highlight LspDiagnosticsDefaultHint guifg=#d2b45f")
-- }}}
