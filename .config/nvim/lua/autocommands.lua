local command = vim.api.nvim_command

command("autocmd BufNewFile,BufRead *.zsh-theme set filetype=zsh")
command("autocmd BufNewFile,BufRead *.js,*.jsx, set filetype=javascriptreact")
command("autocmd BufNewFile,BufRead *.ts,*.tsx, set filetype=typescriptreact")

command(
  "autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.lua,*.py,*.c,*.cpp,*.h,*.hpp,CMakeLists.txt lua vim.lsp.buf.formatting_sync()"
)

command("autocmd FileType floaterm setlocal nonu nornu nocursorline signcolumn=no")
