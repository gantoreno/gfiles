return {
  {
    'AstroNvim/astrotheme',
    lazy = false,
    priority = 1000,
    config = function()
      local c = {
        syntax = {
          red = '#FF838B',
          orange = '#F5983A',
          yellow = '#DFAB25',
          green = '#87C05F',
          cyan = '#4AC2B8',
          blue = '#5EB7FF',
          purple = '#DD97F1',
          text = '#ADB0BB',
          comment = '#696C76',
          mute = '#595C66',
        },
        ui = {
          red = '#F8747E',
          orange = '#EB8332',
          yellow = '#D09214',
          green = '#75AD47',
          cyan = '#00B298',
          blue = '#50A4E9',
          purple = '#CC83E3',
          accent = '#50A4E9',
          tabline = '#111317',
          winbar = '#797D87',
          tool = '#16181D',
          base = '#1A1D23',
          inactive_base = '#16181D',
          statusline = '#111317',
          split = '#111317',
          float = '#14161B',
          border = '#3A3E47',
          current_line = '#1E222A',
          selection = '#2a2e37',
          highlight = '#23272F',
          none_text = '#3A3E47',
          text = '#9B9FA9',
          text_active = '#ADB0BB',
          text_inactive = '#494D56',
          text_match = '#E0E0Ee',
          prompt = '#21242A',
        },
      }

      require('astrotheme').setup({
        style = {
          inactive = false,
        },
        palettes = {
          astrodark = {
            ui = c.ui,
          },
        },
        highlights = {
          astrodark = {
            modify_hl_groups = function(hl, c)
              hl.NvimTreeRootFolder = { fg = c.syntax.blue }
              hl.NvimTreeWinSeparator = { fg = c.ui.split, bg = c.ui.split }
              hl.NvimTreeIndentMarker = { fg = c.ui.border }
              hl.BufferlineCloseButton = { fg = c.ui.red }

              hl.Floaterm = { bg = c.ui.float }
              hl.FloatermNormal = { bg = c.ui.float }

              hl.PmenuSel = { bg = c.ui.selection }

              hl.IncSearch = { link = '@diff.delta' }

              hl.BufferlineCloseButtonVisible = { fg = c.ui.red }
              hl.BufferlineCloseButtonSelected = { fg = c.ui.red }

              hl.TelescopePromptTitle = { link = 'TelescopeResultsNormal' }
              hl.TelescopePromptNormal = { link = 'TelescopeResultsNormal' }
              hl.TelescopePromptBorder = { link = 'TelescopeResultsBorder' }
            end,
          },
        },
      })

      vim.cmd('colorscheme astrotheme')

      local astrotheme = {
        normal = {
          a = { fg = c.ui.base, bg = c.syntax.blue, gui = 'bold' },
          b = { fg = c.ui.text_active, bg = c.ui.selection },
          c = { fg = c.ui.text_active, bg = c.ui.statusline },
        },
        insert = { a = { fg = c.ui.base, bg = c.ui.green, gui = 'bold' } },
        visual = { a = { fg = c.ui.base, bg = c.ui.purple, gui = 'bold' } },
        replace = { a = { fg = c.ui.base, bg = c.ui.red, gui = 'bold' } },
        command = { a = { fg = c.ui.base, bg = c.ui.yellow, gui = 'bold' } },
        terminal = { a = { fg = c.ui.base, bg = c.ui.orange, gui = 'bold' } },
        inactive = {
          a = { fg = c.ui.text_inactive, bg = c.ui.base, gui = 'bold' },
          b = { fg = c.ui.text_inactive, bg = c.ui.base, gui = 'bold' },
          c = { fg = c.ui.text_inactive, bg = c.ui.base, gui = 'bold' },
        },
      }

      require('lualine').setup({
        options = {
          theme = astrotheme,
        },
      })
    end,
  },
}
