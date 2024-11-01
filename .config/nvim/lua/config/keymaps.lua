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
    icon = { icon = '󰊢', color = 'orange' },
  },
  {
    '<leader>lzd',
    '<cmd>FloatermNew --wintype=float --width=0.8 --height=0.8 --position=center lazydocker<cr>',
    desc = 'Lazydocker',
    icon = { icon = '', color = 'blue' },
  },
})

-- Find
which_key.add({
  { '<leader>f', group = 'Find' },
  {
    '<leader>ff',
    '<cmd>Telescope find_files<cr>',
    desc = 'Files',
    icon = { icon = '', color = 'blue' },
    mode = 'n',
  },
  {
    '<leader>ft',
    '<cmd>Telescope live_grep<cr>',
    desc = 'Text',
    icon = { icon = '', color = 'yellow' },
    mode = 'n',
  },
  {
    '<leader>fb',
    '<cmd>Telescope git_branches<cr>',
    desc = 'Branches',
    icon = { icon = '', color = 'cyan' },
    mode = 'n',
  },
  {
    '<leader>fh',
    '<cmd>Telescope highlights<cr>',
    desc = 'Highlights',
    icon = { icon = '󰌁', color = 'purple' },
    mode = 'n',
  },
  {
    '<leader>far',
    '<cmd>lua require("grug-far").open({ transient = true })<cr>',
    desc = 'And Replace',
    icon = { icon = '', color = 'orange' },
    mode = 'n',
  },
})

-- Goto
which_key.add({
  { '<leader>g', group = 'Goto', icon = { icon = '', color = 'azure' } },
  {
    '<leader>gd',
    '<cmd>lua vim.lsp.buf.definition()<cr>',
    desc = 'Definition',
    icon = { icon = '', color = 'green' },
    mode = 'n',
  },
  {
    '<leader>gD',
    '<cmd>lua vim.lsp.buf.declaration()<cr>',
    desc = 'Declaration',
    icon = { icon = '', color = 'cyan' },
    mode = 'n',
  },
})

which_key.add({
  { '<leader>h', group = 'Hunk', icon = { icon = '', color = 'orange' } },
  {
    '<leader>hp',
    '<cmd>Gitsigns preview_hunk<cr>',
    desc = 'Preview',
    icon = { icon = '', color = 'yellow' },
    mode = 'n',
  },
  {
    '<leader>hi',
    '<cmd>Gitsigns preview_hunk_inline<cr>',
    desc = 'Preview (inline)',
    icon = { icon = '', color = 'cyan' },
    mode = 'n',
  },
  {
    '<leader>hr',
    '<cmd>Gitsigns reset_hunk<cr>',
    desc = 'Reset',
    icon = { icon = '', color = 'red' },
    mode = 'n',
  },
})

-- Hover
which_key.add({
  { '<leader>s', group = 'Symbol', icon = { icon = '', color = 'blue' } },
  {
    '<leader>sa',
    '<cmd>lua vim.lsp.buf.code_action()<cr>',
    desc = 'Actions',
    icon = { icon = '', color = 'red' },
    mode = 'n',
  },
  {
    '<leader>sr',
    '<cmd>lua vim.lsp.buf.rename()<cr>',
    desc = 'Rename',
    icon = { icon = '', color = 'purple' },
    mode = 'n',
  },
  {
    '<leader>si',
    '<cmd>lua vim.lsp.buf.hover()<cr>',
    desc = 'Information',
    icon = { icon = '', color = 'green' },
    mode = 'n',
  },
  {
    '<leader>sd',
    '<cmd>lua vim.diagnostic.open_float()<cr>',
    desc = 'Diagnostics',
    icon = { icon = '', color = 'blue' },
    mode = 'n',
  },
})

-- Terminal
which_key.add({
  { '<leader>t', group = 'Floaterm', icon = { icon = '', color = 'green' } },
  {
    '<leader>tt',
    '<cmd>FloatermToggle<cr>',
    desc = 'Toggle',
    icon = { icon = '', color = 'green' },
    mode = 'n',
  },
})

-- NvimTree
which_key.add({
  { '<leader>n', group = 'NvimTree', icon = { icon = '', color = 'red' } },
  {
    '<leader>nn',
    '<cmd>NvimTreeToggle<cr>',
    desc = 'Toggle',
    icon = { icon = '', color = 'red' },
    mode = 'n',
  },
})

-- Comment
which_key.add({
  { '<leader>c', group = 'Comment', icon = { icon = '', color = 'gray' } },
  {
    '<leader>cc',
    ':CommentToggle<cr>',
    desc = 'Code',
    icon = { icon = '', color = 'gray' },
    mode = { 'n', 'v' },
  },
})

-- Organize
which_key.add({
  { '<leader>o', group = 'Organize', icon = { icon = '󰒺', color = 'orange' } },
  {
    '<leader>oi',
    ':OrganizeImports<cr>',
    desc = 'Imports',
    icon = { icon = '󰒺', color = 'orange' },
    mode = { 'n', 'v' },
  },
})
