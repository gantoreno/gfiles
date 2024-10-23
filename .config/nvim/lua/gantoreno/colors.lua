local cmd = vim.cmd

vim.g.material_style = 'darker'

local function blend(hex1, hex2, ratio)
  -- Ensure the ratio is between 0 and 1
  ratio = math.min(math.max(ratio or 0.8, 0), 1)

  -- Convert hex to RGB
  local function hexToRGB(hex)
    hex = hex:gsub('#', '')
    return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
  end

  -- Convert RGB to hex
  local function rgbToHex(r, g, b)
    return string.format('#%02X%02X%02X', math.floor(r), math.floor(g), math.floor(b))
  end

  local r1, g1, b1 = hexToRGB(hex1)
  local r2, g2, b2 = hexToRGB(hex2)

  -- Blend the colors
  local r = r1 * (1 - ratio) + r2 * ratio
  local g = g1 * (1 - ratio) + g2 * ratio
  local b = b1 * (1 - ratio) + b2 * ratio

  return rgbToHex(r, g, b)
end

require('material').setup({
  contrast = {
    sidebars = true,
  },
  styles = {
    comments = {
      bold = false,
      italic = false,
    },
  },
  plugins = {
    'indent-blankline',
    'telescope',
    'nvim-tree',
    'nvim-cmp',
    'nvim-navic',
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

    local m = colors.main
    local e = colors.editor

    return {
      BufferLineOffset = { fg = colors.main.purple, bg = e.bg_alt, bold = true },

      Winbar = { bg = e.bg },
      WinbarNC = { bg = e.bg },

      NvimTreeWinSeparator = { fg = e.bg_alt, bg = e.bg_alt },

      TelescopePromptTitle = { link = 'NormalFloat' },
      TelescopePromptBorder = { link = 'FloatBorder' },

      TelescopeResultsTitle = { link = 'NormalFloat' },
      TelescopeResultsBorder = { link = 'FloatBorder' },

      TelescopePreviewTitle = { link = 'NormalFloat' },
      TelescopePreviewBorder = { link = 'FloatBorder' },

      FloatermBorder = { link = 'FloatBorder' },

      NavicIconsFile = { fg = e.title, bg = 'None' },
      NavicIconsModule = { link = 'NavicIconsFile' },
      NavicIconsNamespace = { fg = m.yellow, bg = 'None' },
      NavicIconsPackage = { link = 'NavicIconsFile' },
      NavicIconsClass = { link = 'NavicIconsModule' },
      NavicIconsMethod = { fg = m.blue, bg = 'None' },
      NavicIconsProperty = { fg = m.purple, bg = 'None' },
      NavicIconsField = { fg = m.cyan, bg = 'None' },
      NavicIconsConstructor = { link = 'NavicIconsProperty' },
      NavicIconsEnum = { link = 'NavicIconsNamespace' },
      NavicIconsInterface = { link = 'NavicIconsModule' },
      NavicIconsFunction = { link = 'NavicIconsMethod' },
      NavicIconsVariable = { fg = m.paleblue, bg = 'None' },
      NavicIconsConstant = { link = 'NavicIconsVariable' },
      NavicIconsString = { fg = m.orange, bg = 'None' },
      NavicIconsNumber = { link = 'NavicIconsString' },
      NavicIconsBoolean = { fg = m.yellow, bg = 'None' },
      NavicIconsArray = { link = 'NavicIconsString' },
      NavicIconsObject = { link = 'NavicIconsString' },
      NavicIconsKey = { link = 'NavicIconsField' },
      NavicIconsNull = { fg = m.red, bg = 'None' },
      NavicIconsEnumMember = { link = 'NavicIconsNamespace' },
      NavicIconsStruct = { link = 'NavicIconsModule' },
      NavicIconsEvent = { link = 'NavicIconsNull' },
      NavicIconsOperator = { link = 'NavicIconsNull' },
      NavicIconsTypeParameter = { link = 'NavicIconsBoolean' },
      NavicText = { fg = e.fg, bg = 'None' },
      NavicSeparator = { link = 'NavicText' },

      ['@markup.heading.1'] = { fg = m.cyan, bold = true },
      RenderMarkdownH1 = { fg = m.cyan, bold = true },
      RenderMarkdownH1Bg = { bg = blend(m.cyan, e.bg) },

      ['@markup.heading.2'] = { fg = m.blue, bold = true },
      RenderMarkdownH2 = { fg = m.blue, bold = true },
      RenderMarkdownH2Bg = { bg = blend(m.blue, e.bg) },

      ['@markup.heading.3'] = { fg = m.purple, bold = true },
      RenderMarkdownH3 = { fg = m.purple, bold = true },
      RenderMarkdownH3Bg = { bg = blend(m.purple, e.bg) },

      ['@markup.heading.4'] = { fg = m.red, bold = true },
      RenderMarkdownH4 = { fg = m.red, bold = true },
      RenderMarkdownH4Bg = { bg = blend(m.red, e.bg) },

      ['@markup.heading.5'] = { fg = m.yellow, bold = true },
      RenderMarkdownH5 = { fg = m.yellow, bold = true },
      RenderMarkdownH5Bg = { bg = blend(m.yellow, e.bg) },

      ['@markup.heading.6'] = { fg = m.green, bold = true },
      RenderMarkdownH6 = { fg = m.green, bold = true },
      RenderMarkdownH6Bg = { bg = blend(m.green, e.bg) },
    }
  end)(),
})

cmd('colorscheme material')
