require('nvim-tree').setup({
  actions = {
    open_file = {
      quit_on_open = true,
    },
    file_popup = {
      open_win_config = {
        border = 'rounded',
      },
    },
  },
  renderer = {
    group_empty = false,
    highlight_git = true,
    special_files = {},
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = '└',
        edge = '│',
        item = '│',
        bottom = '─',
        none = '│',
      },
    },
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
      max = 40,
    },
  },
  filters = {
    dotfiles = false,
    custom = {
      '.DS_Store',
    },
  },
})
