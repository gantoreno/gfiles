require('bufferline').setup({
  options = {
    mode = 'tabs',
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File Explorer',
        text_align = 'left',
        separator = true,
      },
    },
  },
  highlights = {
    offset_separator = {
      link = 'NvimTreeWinSeparator',
    },
  },
})
