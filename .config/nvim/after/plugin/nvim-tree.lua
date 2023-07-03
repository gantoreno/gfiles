local fn = vim.fn
local api = vim.api

local default_icon = {
  glyph = '',
  fg = '#bfc2c1',
  ctermfg = 250,
}

require('nvim-tree').setup({
  actions = {
    open_file = { quit_on_open = true }
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    root_folder_label = function(path)
      return ' ' .. fn.fnamemodify(path, ":t")
    end,
    icons = {
      symlink_arrow = ' -> ',
      show = {
        git = false
      },
      glyphs = {
        default = "",
        folder = {
          default = '',
          open = '',
          empty = '',
          empty_open = '',
          symlink = '',
          symlink_open = '',
          arrow_closed = ' ',
          arrow_open = ' ',
        }
      },
    },
    special_files = {}
  },
  update_focused_file = {
    enable = true
  },
  tab = {
    sync = {
      open = true,
      close = true,
      ignore = {},
    },
  },
  view = { signcolumn = "no" },
  filters = { dotfiles = false },
})

-- Default icon configurations
api.nvim_set_hl(0, 'NvimTreeFileIcon', { fg = default_icon.fg })

require('nvim-web-devicons').set_default_icon(default_icon.glyph, default_icon.fg, default_icon.ctermfg)

-- Other icons
require('nvim-web-devicons').set_icon({
  astro = {
    icon = "",
    color = "#e0622a",
    name = "Astro"
  }
})
