local g = vim.g
local o = vim.o
local command = vim.api.nvim_command
local highlight = vim.highlight

g.startrail_italic_comments = false
g.startrail_italic_functions = false

command('colorscheme startrail')

o.termguicolors = true

command('au VimEnter * hi LspDiagnosticsDefaultError guifg=#cf8164')
command('au VimEnter * hi LspDiagnosticsDefaultWarning guifg=#d2b45f')
command('au VimEnter * hi LspDiagnosticsDefaultInformation guifg=#d2b45f')
command('au VimEnter * hi LspDiagnosticsDefaultHint guifg=#7dc2c7')
