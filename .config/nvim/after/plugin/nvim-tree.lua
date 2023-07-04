local fn = vim.fn
local api = vim.api

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
      symlink_arrow = ' 󱞩 ',
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

-- Custom icon configurations
local custom_icons = {
  default = {
    icon = '',
    color = '#bfc2c1',
    cterm_color = 250,
    name = 'Default'
  },
  astro = {
    icon = "",
    color = "#e0622a",
    name = "Astro"
  },
  css = {
    icon = "",
    color = "#519aba",
    name = "CSS"
  },
  json = {
    icon = '',
    color = '#cbcb41',
    name = 'JSON'
  },
  shell = {
    icon = '',
    color = '#90b556',
    name = 'Shell'
  },
  eslint = {
    icon = '󰱺',
    color = '#9976bf',
    name = 'ESLint'
  },
  lua = {
    icon = '󰢱',
    color = '#519aba',
    name = 'Lua'
  },
  python = {
    icon = '',
    color = '#519aba',
    name = 'Python'
  },
  npm = {
    icon = '',
    color = '#9b3e3e',
    name = 'NPM'
  },
  md = {
    icon = '',
    color = '#519aba',
    name = 'Markdown'
  },
  readme = {
    icon = '',
    color = '#519aba',
    name = 'Readme'
  },
  changelog = {
    icon = '',
    color = '#519aba',
    name = 'Changelog'
  },
  license = {
    icon = '',
    color = '#cbcb41',
    name = 'License'
  },
  jsx = {
    icon = '',
    color = '#519aba',
    name = 'JSX'
  },
  ts = {
    icon = '',
    color = '#519aba',
    name = 'TypeScript'
  },
  toml = {
    icon = "",
    color = "#41535b",
    name = "TOML",
  },
  yml = {
    icon = '',
    color = '#9976bf',
    name = 'YAML'
  },
}

-- Default icon configurations
api.nvim_set_hl(0, 'NvimTreeFileIcon', {
  fg = custom_icons.default.color,
  ctermfg = custom_icons.default.cterm_color
})

require('nvim-web-devicons').set_default_icon(
  custom_icons.default.icon,
  custom_icons.default.color,
  custom_icons.default.cterm_color
)

-- Other icons
require('nvim-web-devicons').set_icon({
  -- Dotfiles
  ['.bash_profile'] = custom_icons.shell,
  ['.bashrc'] = custom_icons.shell,
  ['.ds_store'] = custom_icons.shell,
  ['.gitconfig'] = custom_icons.shell,
  ['.eslintrc'] = custom_icons.eslint,
  ['.eslintrc.js'] = custom_icons.eslint,
  ['.eslintrc.json'] = custom_icons.eslint,
  ['.npmrc'] = custom_icons.npm,
  ['.zprofile'] = custom_icons.shell,
  ['.zshenv'] = custom_icons.shell,
  ['.zshrc'] = custom_icons.shell,

  -- Specials
  ['package-lock.json'] = custom_icons.json,
  ['package.json'] = custom_icons.json,
  ['cmakelists.txt'] = custom_icons.shell,
  ['readme.md'] = custom_icons.readme,
  ['changelog.md'] = custom_icons.changelog,
  ['license.md'] = custom_icons.license,

  -- Filetypes
  ['astro'] = custom_icons.astro,
  ['bat'] = custom_icons.shell,
  ['css'] = custom_icons.css,
  ['cmake'] = custom_icons.shell,
  ['conf'] = custom_icons.shell,
  ['gd'] = custom_icons.shell,
  ['ini'] = custom_icons.shell,
  ['jsx'] = custom_icons.jsx,
  ['ts'] = custom_icons.ts,
  ['tsx'] = custom_icons.ts,
  ['lua'] = custom_icons.lua,
  ['md'] = custom_icons.md,
  ['mdx'] = custom_icons.md,
  ['py'] = custom_icons.python,
  ['toml'] = custom_icons.toml,
  ['yaml'] = custom_icons.yml,
  ['yml'] = custom_icons.yml,
})
