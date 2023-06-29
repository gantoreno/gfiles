local api = vim.api

local tree_group = api.nvim_create_augroup("Tree", { clear = true })

-- Autocommands
api.nvim_create_autocmd(
  'FileType',
  { pattern = 'floaterm', command = 'setlocal nonumber nocursorline norelativenumber signcolumn=no', group = tree_group }
)


api.nvim_create_autocmd(
  { 'BufNewFile', 'BufRead' },
  { pattern = '*.mdx', command = 'setlocal ft=markdown' }
)

api.nvim_create_autocmd(
  { 'BufNewFile', 'BufRead' },
  { pattern = '.env*', command = 'setlocal ft=config' }
)
