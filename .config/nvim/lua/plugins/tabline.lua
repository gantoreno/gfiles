return {
  {
    'akinsho/bufferline.nvim',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local bufferline = require('bufferline')

      bufferline.setup({
        options = {
          mode = 'tabs',
          style_preset = {
            bufferline.style_preset.no_bold,
            bufferline.style_preset.no_italic,
          },
          offsets = {
            {
              filetype = 'NvimTree',
              text_align = 'left',
              separator = true,
              highlight = 'BufferLineOffset',
            },
          },
        },
        highlights = {
          fill = {
            link = 'NvimTreeNormal',
          },
          offset_separator = {
            link = 'NvimTreeWinSeparator',
          },
        },
      })

      local c = require('astrotheme.palettes.astrodark')

      -- Sometimes you just have to force things
      vim.api.nvim_set_hl(0, 'BufferlineCloseButton', { fg = c.ui.red, bg = c.ui.base })
      vim.api.nvim_set_hl(0, 'BufferlineCloseButtonVisible', { fg = c.ui.red, bg = c.ui.base })
      vim.api.nvim_set_hl(0, 'BufferlineCloseButtonSelected', { fg = c.ui.red, bg = c.ui.base })
    end,
  },
}
