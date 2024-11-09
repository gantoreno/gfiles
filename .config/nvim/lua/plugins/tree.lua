return {
  {
    'nvim-tree/nvim-web-devicons',
    opts = {
      default = true,
    },
  },
  {
    'nvim-tree/nvim-tree.lua',
    opts = {
      hijack_cursor = true,
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
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              default = '',
              open = '',
              empty = '',
              empty_open = '',
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
    },
  },
}
