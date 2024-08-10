local cmd = vim.cmd

require('onedark').setup({
  code_style = {
    keywords = 'italic',
  },
  highlights = {
    NvimTreeWinSeparator = { bg = '#232326', fg = '#232326' },
    TabLineSel = { fg = '#9d9fa5', bg = '#38383d' },
    ['@tag.delimiter'] = { fg = '#9d9fa5' },
    ['@tag.attribute'] = { fg = '#D19A66' },
    ['@tag'] = { fg = '#dcb672' },
  },
  style = 'warmer',
})

cmd('colorscheme onedark')
