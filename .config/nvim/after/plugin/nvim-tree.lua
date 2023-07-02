require('nvim-tree').setup({
  actions = {
    open_file = { quit_on_open = true }
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    root_folder_label = function(path)
      return ' ' .. vim.fn.fnamemodify(path, ":t")
    end,
    icons = {
      symlink_arrow = ' -> ',
      show = {
        git = false
      },
      glyphs = {
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
    tenable = true
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
