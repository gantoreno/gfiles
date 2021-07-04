--    ______      __         _      __   Gabriel Moreno
--   / ____/___ _/ /_  _____(_)__  / /   ==============
--  / / __/ __ `/ __ \/ ___/ / _ \/ /    E-mail:   gantoreno@gmail.com
-- / /_/ / /_/ / /_/ / /  / /  __/ /     Website:  https://gantoreno.com
-- \____/\__,_/_.___/_/  /_/\___/_/      GitHub:   https://github.com/gantoreno
--
-- Neovim autocommands file

-- Variables {{{
local command = vim.api.nvim_command
-- }}}

-- Commands {{{
command("autocmd BufEnter * if &filetype == 'NvimTree' | setlocal signcolumn=no | endif")

command("autocmd BufNewFile,BufRead *.js,*.jsx set filetype=javascriptreact")
command("autocmd BufNewFile,BufRead *.tsx,*.ts set filetype=typescriptreact")
command("autocmd BufNewFile,BufRead *.zsh-theme set filetype=zsh")
command(
  'autocmd BufNewFile,BufRead *.html,*.css,*.js,*.jsx,*.ts,*.tsx let g:user_emmet_expandabbr_key="<tab>" | imap <expr> <Tab> emmet#expandAbbrIntelligent("<tab>")'
)

command("autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.lua,*.py lua vim.lsp.buf.formatting_sync(nil, 150)")
-- }}}
