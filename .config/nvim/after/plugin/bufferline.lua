require('bufferline').setup({
  options = {
    mode = 'tabs',
    offsets = {
      {
        filetype = 'NvimTree',
        text = ' File Explorer',
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
