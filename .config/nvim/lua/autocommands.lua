local api = vim.api

local tree_group = api.nvim_create_augroup("Tree", { clear = true })

-- Autocommands
api.nvim_create_autocmd(
  'FileType',
  {
    pattern = 'floaterm',
    command = 'setlocal nonumber nocursorline norelativenumber signcolumn=no winbar=',
    group = tree_group
  }
)

api.nvim_create_autocmd(
  { 'BufNewFile', 'BufRead' },
  { pattern = '*.mdx', command = 'setlocal ft=markdown' }
)
api.nvim_create_autocmd(
  { 'BufNewFile', 'BufRead' },
  { pattern = '.env*', command = 'setlocal ft=config' }
)

-- api.nvim_create_autocmd(
--   { 'BufWritePost' },
--   { pattern = '*.js,*.ts,*.jsx,*.tsx,*.astro', command = 'FormatWrite' }
-- )
api.nvim_create_autocmd(
  { 'BufWritePre' },
  { pattern = '*', command = 'lua vim.lsp.buf.format({ async = false })' }
)
