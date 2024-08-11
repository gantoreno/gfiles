local cmd = vim.cmd

function ToGrayscale(hex)
  -- Remove the '#' if it's present
  hex = hex:gsub('#', '')

  -- Convert the hex color to RGB
  local r = tonumber(hex:sub(1, 2), 16)
  local g = tonumber(hex:sub(3, 4), 16)
  local b = tonumber(hex:sub(5, 6), 16)

  -- Calculate the grayscale value using the luminance formula
  local gray = math.floor(0.299 * r + 0.587 * g + 0.114 * b)

  -- Convert the grayscale value back to hex
  local grayscaleHex = string.format('#%02X%02X%02X', gray, gray, gray)

  return grayscaleHex
end

require('onedark').setup({
  colors = {
    black = ToGrayscale('#101012'),
    bg0 = ToGrayscale('#232326'),
    bg1 = ToGrayscale('#2c2d31'),
    bg2 = ToGrayscale('#35363b'),
    bg3 = ToGrayscale('#37383d'),
    bg_d = ToGrayscale('#1b1c1e'),
    bg_blue = '#68aee8',
    bg_yellow = '#e2c792',
    fg = ToGrayscale('#a7aab0'),
    purple = '#bb70d2',
    green = '#8fb573',
    orange = '#c49060',
    blue = '#57a5e5',
    yellow = '#dbb671',
    cyan = '#51a8b3',
    red = '#de5d68',
    grey = ToGrayscale('#5a5b5e'),
    light_grey = ToGrayscale('#818387'),
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

    NormalFloat = { fg = '$fg', bg = 'none' },

    ['@tag.delimiter'] = { fg = '$fg' },
    ['@tag.attribute'] = { fg = '$orange' },
    ['@tag'] = { fg = '$yellow' },

    ['@constructor.lua'] = { fg = '$light_grey' },
  },
  style = 'warmer',
})

cmd('colorscheme onedark')
