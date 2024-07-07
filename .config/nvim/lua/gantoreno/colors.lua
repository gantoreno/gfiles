local g = vim.g

local api = vim.api
local cmd = vim.cmd

require('material').setup({
  plugins = {
    'nvim-tree',
    'telescope',
  },
  styles = {
    keywords = { italic = true },
  },
  disable = {
    eob_lines = true,
  },
})

g.material_style = 'darker'

cmd('colorscheme material')
