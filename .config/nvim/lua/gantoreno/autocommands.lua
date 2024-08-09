local api = vim.api

-- Autocommands
api.nvim_create_autocmd('FileType', {
  pattern = 'floaterm',
  command = 'setlocal nonumber nocursorline norelativenumber signcolumn=no',
})

api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, { pattern = '*.mdx', command = 'setlocal ft=markdown' })
api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, { pattern = '.env*', command = 'setlocal ft=config' })

api.nvim_create_autocmd({ 'BufWritePost' }, { pattern = '*', command = 'FormatWrite' })
api.nvim_create_autocmd({ 'BufWritePre' }, { pattern = '*', command = 'ColorizerReloadAllBuffers' })

api.nvim_create_autocmd('QuitPre', {
  callback = function()
    local invalid_win = {}
    local wins = api.nvim_list_wins()

    for _, w in ipairs(wins) do
      local bufname = api.nvim_buf_get_name(api.nvim_win_get_buf(w))

      if bufname:match('NvimTree_') ~= nil then
        table.insert(invalid_win, w)
      end
    end

    if #invalid_win == #wins - 1 then
      for _, w in ipairs(invalid_win) do
        api.nvim_win_close(w, true)
      end
    end
  end,
})
