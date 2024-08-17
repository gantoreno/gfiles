local o = vim.o

local api = vim.api
local lsp = vim.lsp

o.shiftwidth = 8

vim.api.nvim_create_autocmd('BufWritePre', {
  group = vim.api.nvim_create_augroup('TemplOnSave', { clear = true }),
  callback = function(opts)
    if vim.bo[opts.buf].filetype == 'templ' then
      lsp.buf.format({ async = false })
    end
  end,
})
