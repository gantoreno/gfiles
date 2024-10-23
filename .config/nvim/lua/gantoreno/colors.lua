local cmd = vim.cmd

vim.g.material_style = 'darker'

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
    }
  end)(),
})

cmd('colorscheme material')
