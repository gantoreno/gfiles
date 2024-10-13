local which_key = require('which-key')

-- Generic
which_key.add({
  -- Tabs
  { '<leader><left>', '<cmd>tabprev<cr>', desc = 'Previous tab' },
  { '<leader><right>', '<cmd>tabnext<cr>', desc = 'Next tab' },

  -- Lazygit
  {
    '<leader>lzg',
    '<cmd>FloatermNew --wintype=float --width=0.8 --height=0.8 --position=center lazygit<cr>',
    desc = 'Lazygit',
  },
})

-- Find
which_key.add({
  { '<leader>f', group = 'Find' },
  { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Files', mode = 'n' },
  { '<leader>ft', '<cmd>Telescope live_grep<cr>', desc = 'Text', mode = 'n' },
  { '<leader>fb', '<cmd>Telescope git_branches<cr>', desc = 'Branches', mode = 'n' },
})

-- Goto
which_key.add({
  { '<leader>g', group = 'Goto' },
  { '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>', desc = 'Definition', mode = 'n' },
  { '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', desc = 'Declaration', mode = 'n' },
})

-- Hover
which_key.add({
  { '<leader>s', group = 'Symbol' },
  { '<leader>sa', '<cmd>lua vim.lsp.buf.code_action()<cr>', desc = 'Actions', mode = 'n' },
  { '<leader>sr', '<cmd>lua vim.lsp.buf.rename()<cr>', desc = 'Rename', mode = 'n' },
  { '<leader>ss', '<cmd>lua vim.lsp.buf.hover()<cr>', desc = 'Symbol', mode = 'n' },
  { '<leader>sd', '<cmd>lua vim.diagnostic.open_float()<cr>', desc = 'Diagnostics', mode = 'n' },
})

-- Terminal
which_key.add({
  { '<leader>t', group = 'Floaterm' },
  { '<leader>tt', '<cmd>FloatermToggle<cr>', desc = 'Toggle', mode = 'n' },
})

-- NvimTree
which_key.add({
  { '<leader>n', group = 'NvimTree' },
  { '<leader>nn', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle', mode = 'n' },
})
