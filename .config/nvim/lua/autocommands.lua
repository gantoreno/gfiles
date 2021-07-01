local command = vim.api.nvim_command

command('autocmd BufEnter * if &filetype == \'NvimTree\' | setlocal signcolumn=no | endif')
command('autocmd BufNewFile,BufRead *.js,*.jsx set filetype=javascript.jsx')
command('autocmd BufNewFile,BufRead *.tsx,*.ts set filetype=typescript.tsx')
command('autocmd BufNewFile,BufRead *.zsh-theme set filetype=zsh')
command('autocmd BufNewFile,BufRead *.html,*.css,*.js,*.jsx,*.ts,*.tsx let g:user_emmet_expandabbr_key="<Tab>" | imap <expr> <Tab> emmet#expandAbbrIntelligent("<Tab>")')

