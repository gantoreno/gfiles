-- Autopairs
require("nvim-autopairs").setup({ check_ts = true })

-- Comments
require("nvim_comment").setup({})

-- File tree
require('nvim-tree').setup({
  actions = {
    open_file = { quit_on_open = true }
  },
  renderer = {
    group_empty = true,
    icons = {
      git_placement = 'after',
      glyphs = {
        folder = {
          default = '',
          open = '',
          arrow_closed = '',
          arrow_open = '',
        }
      },
    },
    special_files = {}
  },
  update_focused_file = { enable = true },
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

-- Telescope
require('telescope').setup({
  defaults = {
    mappings = { 
      i = { ['<esc>'] = require('telescope.actions').close } 
    },
    file_ignore_patterns = { 'node_modules', '.git', 'build' },
  },
})

-- Treesitter
require('nvim-treesitter.configs').setup({
  ensure_installed = 'all',
  indent = { enable = true },
  highlight = { enable = true },
})

-- Devicons
require('nvim-web-devicons').setup({
  strict = true,
  override_by_extension = {
    ["astro"] = {
      icon = "󰑣",
      color = "#e0622a",
      name = "Astro"
    }
  };
})