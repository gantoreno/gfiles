local cmd = vim.cmd

local tograyscale = require('gantoreno.utils.colors').tograyscale

require('onedark').setup({
  colors = {
    black = tograyscale('#101012'),
    bg0 = tograyscale('#232326'),
    bg1 = tograyscale('#2c2d31'),
    bg2 = tograyscale('#35363b'),
    bg3 = tograyscale('#37383d'),
    bg_d = tograyscale('#1e1e1d'),
    bg_blue = '#68aee8',
    bg_yellow = '#e2c792',
    fg = tograyscale('#a7aab0'),
    purple = '#bb70d2',
    green = '#8fb573',
    orange = '#c49060',
    blue = '#57a5e5',
    yellow = '#dbb671',
    cyan = '#51a8b3',
    red = '#de5d68',
    grey = tograyscale('#5a5b5e'),
    light_grey = tograyscale('#818387'),
    dark_cyan = '#2b5d63',
    dark_red = '#833b3b',
    dark_yellow = '#7c5c20',
    dark_purple = '#79428a',
    diff_add = '#282b26',
    diff_delete = '#2a2626',
    diff_change = '#1a2a37',
    diff_text = '#2c485f',
  },
  highlights = {
    NvimTreeWinSeparator = { bg = '$bg0', fg = '$bg0' },
    TabLineSel = { fg = '$fg', bg = '$bg3' },

    TelescopeResultsBorder = { fg = '$fg' },
    TelescopePreviewBorder = { fg = '$fg' },
    TelescopePromptBorder = { fg = '$fg' },

    TelescopeResultsTitle = { fg = '$fg' },
    TelescopePreviewTitle = { fg = '$fg' },
    TelescopePromptTitle = { fg = '$fg' },

    FloatermBorder = { fg = '$fg', bg = 'none' },

    ['@tag.delimiter'] = { fg = '$fg' },
    ['@tag.attribute'] = { fg = '$orange' },
    ['@tag'] = { fg = '$yellow' },

    ['@operator'] = { fg = '$blue' },

    ['@constructor.lua'] = { fg = '$light_grey' },
  },
  style = 'warmer',
})

cmd('colorscheme onedark')
