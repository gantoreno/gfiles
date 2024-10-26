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
    root_folder_label = false,
    icons = {
      glyphs = {
        folder = {
          arrow_closed = '󰅂',
          arrow_open = '󰅀',
          default = '',
          open = '',
          empty = '',
          empty_open = '',
          symlink = '',
          symlink_open = '',
        },
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
    signcolumn = 'yes',
    width = {
      min = '33%',
      max = 40,
    },
  },
  filters = {
    dotfiles = false,
    git_ignored = false,
    custom = {
      '.DS_Store',
    },
  },
})
