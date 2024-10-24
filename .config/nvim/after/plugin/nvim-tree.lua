local bo = vim.bo

local fn = vim.fn
local api = vim.api

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
    signcolumn = 'yes',
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

api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  callback = function()
    local filetype = bo.filetype

    if filetype == 'NvimTree' then
      local directory = vim.fn.fnamemodify(vim.loop.cwd(), ':~:s?$?/..?')

      vim.wo.winbar = '%#NvimTreeIndentMarker# %#@markup.heading.3# ' .. directory
    end
  end,
})
