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
  {
    '<leader>lzd',
    '<cmd>FloatermNew --wintype=float --width=0.8 --height=0.8 --position=center lazydocker<cr>',
    desc = 'Lazydocker',
  },
})

-- Find
which_key.add({
  { '<leader>f', group = 'Find' },
  {
    '<leader>ff',
    '<cmd>Telescope find_files<cr>',
    desc = 'Files',
    mode = 'n',
  },
  {
    '<leader>ft',
    '<cmd>Telescope live_grep<cr>',
    desc = 'Text',
    mode = 'n',
  },
  {
    '<leader>fb',
    '<cmd>Telescope git_branches<cr>',
    desc = 'Branches',
    mode = 'n',
  },
  {
    '<leader>fh',
    '<cmd>Telescope highlights<cr>',
    desc = 'Highlights',
    mode = 'n',
  },
  {
    '<leader>far',
    '<cmd>lua require("grug-far").open({ transient = true })<cr>',
    desc = 'And Replace',
    mode = 'n',
  },
})

-- Goto
which_key.add({
  { '<leader>g', group = 'Goto' },
  {
    '<leader>gd',
    '<cmd>lua vim.lsp.buf.definition()<cr>',
    desc = 'Definition',
    mode = 'n',
  },
  {
    '<leader>gD',
    '<cmd>lua vim.lsp.buf.declaration()<cr>',
    desc = 'Declaration',
    mode = 'n',
  },
})

which_key.add({
  { '<leader>h', group = 'Hunk' },
  {
    '<leader>hp',
    '<cmd>Gitsigns preview_hunk<cr>',
    desc = 'Preview',
    mode = 'n',
  },
  {
    '<leader>hi',
    '<cmd>Gitsigns preview_hunk_inline<cr>',
    desc = 'Preview (inline)',
    mode = 'n',
  },
  {
    '<leader>hr',
    '<cmd>Gitsigns reset_hunk<cr>',
    desc = 'Reset',
    mode = 'n',
  },
})

-- Hover
which_key.add({
  { '<leader>s', group = 'Symbol' },
  {
    '<leader>sa',
    '<cmd>lua vim.lsp.buf.code_action()<cr>',
    desc = 'Actions',
    mode = 'n',
  },
  {
    '<leader>sr',
    '<cmd>lua vim.lsp.buf.rename()<cr>',
    desc = 'Rename',
    mode = 'n',
  },
  {
    '<leader>si',
    '<cmd>lua vim.lsp.buf.hover()<cr>',
    desc = 'Information',
    mode = 'n',
  },
  {
    '<leader>sd',
    '<cmd>lua vim.diagnostic.open_float()<cr>',
    desc = 'Diagnostics',
    mode = 'n',
  },
})

-- Terminal
which_key.add({
  { '<leader>t', group = 'Floaterm' },
  {
    '<leader>tt',
    '<cmd>FloatermToggle<cr>',
    desc = 'Toggle',
    mode = 'n',
  },
})

-- NvimTree
which_key.add({
  { '<leader>n', group = 'NvimTree' },
  {
    '<leader>nn',
    '<cmd>NvimTreeToggle<cr>',
    desc = 'Toggle',
    mode = 'n',
  },
})

-- Comment
which_key.add({
  { '<leader>c', group = 'Comment' },
  {
    '<leader>cc',
    ':CommentToggle<cr>',
    desc = 'Code',
    mode = { 'n', 'v' },
  },
})

-- Organize
which_key.add({
  { '<leader>o', group = 'Organize' },
  {
    '<leader>oi',
    ':OrganizeImports<cr>',
    desc = 'Imports',
    mode = { 'n', 'v' },
  },
})
