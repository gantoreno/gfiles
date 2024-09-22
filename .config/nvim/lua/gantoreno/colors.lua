local cmd = vim.cmd

vim.g.material_style = 'deep ocean'

require('material').setup({
  contrast = {
    terminal = true,
    sidebars = true,
    floating_windows = true,
  },
  styles = {
    comments = { bold = false, italic = true },
  },
  plugins = {
    'indent-blankline',
    'telescope',
    'nvim-tree',
    'nvim-cmp',
    'nvim-web-devicons',
  },
  disable = {
    eob_lines = true,
  },
  custom_colors = function(colors)
    colors.editor.accent = colors.main.blue
  end,
  custom_highlights = (function()
    local colors = require('material.colors')

    return {
      NvimTreeWinSeparator = { fg = colors.editor.bg },

      TelescopePromptTitle = { link = 'NormalFloat' },
      TelescopePromptBorder = { link = 'NormalFloat' },

      TelescopeResultsTitle = { link = 'NormalFloat' },
      TelescopeResultsBorder = { link = 'NormalFloat' },

      TelescopePreviewTitle = { link = 'NormalFloat' },
      TelescopePreviewBorder = { link = 'NormalFloat' },
    }
  end)(),
})

cmd('colorscheme material-deep-ocean')
