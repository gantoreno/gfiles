local api = vim.api
local tbl_extend = vim.tbl_extend

-- Functions
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }

  if opts then
    options = tbl_extend('force', options, opts)
  end

  api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Mappings
map('n', '<C-h>', '<C-\\><C-n><C-w>h', { silent = true })
map('n', '<C-j>', '<C-\\><C-n><C-w>j', { silent = true })
map('n', '<C-k>', '<C-\\><C-n><C-w>k', { silent = true })
map('n', '<C-l>', '<C-\\><C-n><C-w>l', { silent = true })

map('t', '<C-h>', '<C-\\><C-n><C-w>h', { silent = true })
map('t', '<C-j>', '<C-\\><C-n><C-w>j', { silent = true })
map('t', '<C-k>', '<C-\\><C-n><C-w>k', { silent = true })
map('t', '<C-l>', '<C-\\><C-n><C-w>l', { silent = true })

map('n', '<leader>ss', ':Inspect<CR>', { silent = true })

map('n', '<leader><left>', ':tabprev<CR>', { silent = true })
map('n', '<leader><right>', ':tabnext<CR>', { silent = true })

map('n', '<C-p>', ':Telescope find_files<CR>', { silent = true })
map('n', '<C-g>', ':Telescope live_grep<CR>', { silent = true })
map('n', '<C-s>', ':Telescope git_branches<CR>', { nowait = true, silent = true })

map('n', '<C-n>', ':NvimTreeToggle<CR>', { silent = true })

map('n', '<C-t>', ':FloatermToggle<CR>', { silent = true })

map('n', '<C-c>', ':CommentToggle<cr>', { silent = true })
map('v', '<C-c>', ':CommentToggle<cr>', { silent = true })

map(
  'n',
  '<leader>lzg',
  ':FloatermNew --wintype=float --width=0.8 --height=0.8 --position=center lazygit<CR>',
  { silent = true }
)
map(
  'n',
  '<leader>glg',
  ':FloatermNew --wintype=float --width=0.8 --height=0.8 --position=center git log --graph --oneline<CR>',
  { silent = true }
)
