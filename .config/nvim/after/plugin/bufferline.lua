local fn = vim.fn
local loop = vim.loop

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
        text = function()
          return fn.fnamemodify(loop.cwd(), ':~:s?$?/..?')
        end,
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
