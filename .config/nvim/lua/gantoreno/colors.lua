local cmd = vim.cmd

vim.g.material_style = 'deep ocean'

require('material').setup({
  contrast = {
    terminal = true,
    sidebars = true,
    floating_windows = true,
  },
  styles = {
    comments = { bold = false, italic = true },
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
      Winbar = { bg = e.bg },
      WinbarNC = { bg = e.bg },

      NvimTreeWinSeparator = { fg = e.bg },

      TelescopePromptTitle = { link = 'NormalFloat' },
      TelescopePromptBorder = { link = 'NormalFloat' },

      TelescopeResultsTitle = { link = 'NormalFloat' },
      TelescopeResultsBorder = { link = 'NormalFloat' },

      TelescopePreviewTitle = { link = 'NormalFloat' },
      TelescopePreviewBorder = { link = 'NormalFloat' },

      NavicIconsFile = { fg = e.title, bg = e.selection },
      NavicIconsModule = { link = 'NavicIconsFile' },
      NavicIconsNamespace = { fg = m.yellow, bg = e.selection },
      NavicIconsPackage = { link = 'NavicIconsFile' },
      NavicIconsClass = { link = 'NavicIconsModule' },
      NavicIconsMethod = { fg = m.blue, bg = e.selection },
      NavicIconsProperty = { fg = m.purple, bg = e.selection },
      NavicIconsField = { fg = m.cyan, bg = e.selection },
      NavicIconsConstructor = { link = 'NavicIconsProperty' },
      NavicIconsEnum = { link = 'NavicIconsNamespace' },
      NavicIconsInterface = { link = 'NavicIconsModule' },
      NavicIconsFunction = { link = 'NavicIconsMethod' },
      NavicIconsVariable = { fg = m.paleblue, bg = e.selection },
      NavicIconsConstant = { link = 'NavicIconsVariable' },
      NavicIconsString = { fg = m.orange, bg = e.selection },
      NavicIconsNumber = { link = 'NavicIconsString' },
      NavicIconsBoolean = { fg = m.yellow, bg = e.selection },
      NavicIconsArray = { link = 'NavicIconsString' },
      NavicIconsObject = { link = 'NavicIconsString' },
      NavicIconsKey = { link = 'NavicIconsField' },
      NavicIconsNull = { fg = m.red, bg = e.selection },
      NavicIconsEnumMember = { link = 'NavicIconsNamespace' },
      NavicIconsStruct = { link = 'NavicIconsModule' },
      NavicIconsEvent = { link = 'NavicIconsNull' },
      NavicIconsOperator = { link = 'NavicIconsNull' },
      NavicIconsTypeParameter = { link = 'NavicIconsBoolean' },
      NavicText = { fg = e.fg, bg = e.selection },
      NavicSeparator = { link = 'NavicText' },
    }
  end)(),
})

cmd('colorscheme material-deep-ocean')
