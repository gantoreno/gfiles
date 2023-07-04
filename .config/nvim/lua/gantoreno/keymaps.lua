local api = vim.api
local tbl_extend = vim.tbl_extend

-- Functions
function map(mode, lhs, rhs, opts)
  local options = { noremap = true }

  if opts then
    options = tbl_extend("force", options, opts)
  end

  api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Mappings
map("n", "<C-h>", "<C-\\><C-n><C-w>h", { silent = true })
map("n", "<C-j>", "<C-\\><C-n><C-w>j", { silent = true })
map("n", "<C-k>", "<C-\\><C-n><C-w>k", { silent = true })
map("n", "<C-l>", "<C-\\><C-n><C-w>l", { silent = true })

map("t", "<C-h>", "<C-\\><C-n><C-w>h", { silent = true })
map("t", "<C-j>", "<C-\\><C-n><C-w>j", { silent = true })
map("t", "<C-k>", "<C-\\><C-n><C-w>k", { silent = true })
map("t", "<C-l>", "<C-\\><C-n><C-w>l", { silent = true })

map("n", "<leader><left>", ":tabprev<CR>", { silent = true })
map("n", "<leader><right>", ":tabnext<CR>", { silent = true })

map("n", "<C-f>", ":lua require('telescope.builtin').find_files({ hidden = true })<CR>", { silent = true })
map("n", "<C-g>", ":lua require('telescope.builtin').live_grep({ hidden = true })<CR>", { silent = true })

map("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })

map("n", "<C-s>", ":FloatermToggle<CR>", { silent = true })

map("n", "<leadet>tsp", ":TSPlaygroundToggle<CR>", { silent = true })

map("n", "<leader>lzg", ":FloatermNew --wintype=float --width=0.8 --height=0.8 --position=center lazygit<CR>",
  { silent = true })
