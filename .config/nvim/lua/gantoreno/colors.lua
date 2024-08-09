local cmd = vim.cmd

require('catppuccin').setup({
  flavour = 'mocha',
  color_overrides = {
    mocha = {
      rosewater = '#ffc9c9',
      flamingo = '#ff9f9a',
      pink = '#ffa9c9',
      mauve = '#df95cf',
      lavender = '#a990c9',
      red = '#ff6960',
      maroon = '#f98080',
      peach = '#f9905f',
      yellow = '#f9bd69',
      green = '#b0d080',
      teal = '#a0dfa0',
      sky = '#a0d0c0',
      sapphire = '#95b9d0',
      blue = '#89a0e0',
      text = '#e0e0e0',
      subtext1 = '#d5d5d5',
      subtext0 = '#bdbdbd',
      overlay2 = '#929292',
      overlay1 = '#7c7c7c',
      overlay0 = '#666666',
      surface2 = '#505050',
      surface1 = '#3a3a3a',
      surface0 = '#252525',
      base = '#151515',
      mantle = '#191919',
      crust = '#080808',
    },
  },
  highlight_overrides = {
    mocha = function(mocha)
      return {
        WinSeparator = { fg = mocha.surface0 },
        NvimTreeEndOfBuffer = { fg = mocha.mantle },
        TreesitterContextBottom = { style = {} },
        TreesitterContextLineNumberBottom = { style = {} },
      }
    end,
  },
  integrations = {
    indent_blankline = {
      enabled = true,
      scope_color = 'mantle', -- catppuccin color (eg. `lavender`) Default: text
    },
  },
})

cmd('colorscheme catppuccin')
