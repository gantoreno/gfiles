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
  custom_highlights = {
    CursorLine = { bg = '#171717' },
    ["@punctuation.delimiter.astro"] = { fg = "#515151" },
  }
})

g.material_style = 'darker'

cmd('colorscheme material')
