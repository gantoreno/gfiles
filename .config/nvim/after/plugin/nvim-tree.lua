local fn = vim.fn
local api = vim.api

require('nvim-tree').setup({
  actions = {
    open_file = { quit_on_open = true },
    file_popup = {
      open_win_config = {
        border = 'rounded',
      },
    },
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    special_files = {},
  },
  update_focused_file = {
    enable = true,
  },
  tab = {
    sync = {
      open = true,
      close = true,
      ignore = {},
    },
  },
  view = {
    signcolumn = 'no',
    width = {
      min = '33%',
      max = 40
    }
  },
  filters = {
    dotfiles = false,
    custom = {
      '.DS_Store',
    },
  },
})
