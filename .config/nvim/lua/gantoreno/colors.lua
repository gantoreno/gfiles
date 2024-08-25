local cmd = vim.cmd

require('onedark').setup({
  colors = {
    black = '#0c0c0c',
    bg0 = '#1a1a1a',
    bg1 = '#212121',
    bg1_5 = '#282828',
    bg2 = '#2f2f2f',
    bg3 = '#363636',
    bg_d = '#171717',
    bg_blue = '#8f9dc8',
    bg_yellow = '#d6bd87',
    fg = '#d7d7d7',
    purple = '#afa2c8',
    green = '#acbf87',
    orange = '#D7A085',
    blue = '#8f9dc8',
    yellow = '#d6bd87',
    cyan = '#a9d3da',
    red = '#d88382',
    grey = '#565656',
    light_grey = '#7d7d7d',
    dark_cyan = '#377680',
    dark_red = '#6c2322',
    dark_yellow = '#6c5625',
    dark_purple = '#493b63',
    diff_add = '#0b0d07',
    diff_delete = '#272e19',
    diff_change = '#1d243b',
    diff_text = '#323f66',
  },
  highlights = {
    NormalFloat = { bg = '$bg1_5' },
    TabLineSel = { fg = '$fg', bg = '$bg3' },
    Visual = { bg = '$bg1_5' },

    TelescopeResultsBorder = { fg = '$grey' },
    TelescopePreviewBorder = { fg = '$grey' },
    TelescopePromptBorder = { fg = '$grey' },

    TelescopeResultsTitle = { fg = '$grey' },
    TelescopePreviewTitle = { fg = '$grey' },
    TelescopePromptTitle = { fg = '$grey' },
    TelescopeMatching = { fg = '$yellow', bold = true },

    FloatermBorder = { fg = '$grey', bg = 'none' },

    IblIndent = { fg = '$bg2' },
    IblScope = { fg = '$grey' },

    NvimTreeRootFolder = { fg = '$yellow' },
    NvimTreeWinSeparator = { bg = '$bg0', fg = '$bg0' },

    TreeSitterContext = { bg = '$bg1' },

    ['@type'] = { fg = '$cyan' },

    ['@tag'] = { fg = '$cyan' },
    ['@tag.astro'] = { fg = '$blue' },
    ['@tag.attribute'] = { fg = '$purple' },
    ['@tag.delimiter'] = { fg = '$light_grey' },
    ['@tag.builtin'] = { fg = '$blue' },

    ['@constructor.lua'] = { fg = '$light_grey' },
    ['@constructor.javascript'] = { fg = '$cyan', bold = false },
    ['@constructor.typescript'] = { fg = '$cyan', bold = false },

    ['@operator'] = { fg = '$light_grey' },

    ['@punctuation.special'] = { fg = '$light_grey' },
  },
  style = 'warmer',
})

cmd('colorscheme onedark')
