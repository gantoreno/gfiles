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
    root_folder_label = function(path)
      return ' ' .. fn.fnamemodify(path, ':t')
    end,
    icons = {
      symlink_arrow = ' 󱞩 ',
      show = {
        git = false,
      },
      glyphs = {
        default = '',
        folder = {
          default = '',
          open = '',
          empty = '',
          empty_open = '',
          symlink = '',
          symlink_open = '',
          arrow_closed = ' ',
          arrow_open = ' ',
        },
      },
    },
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
  view = { signcolumn = 'no' },
  filters = { dotfiles = false },
})

-- Custom icon configurations
local custom_icons = {
  default = {
    icon = '',
    color = '#bfc2c1',
    cterm_color = 250,
    name = 'Default',
  },
  astro = {
    icon = '󱎯',
    color = '#d07c44',
    name = 'Astro',
  },
  css = {
    icon = '',
    color = '#5e91ae',
    name = 'CSS',
  },
  json = {
    icon = '',
    color = '#cbcb41',
    name = 'JSON',
  },
  shell = {
    icon = '',
    color = '#90b556',
    name = 'Shell',
  },
  eslint = {
    icon = '󰱺',
    color = '#9976bf',
    name = 'ESLint',
  },
  lua = {
    icon = '󰢱',
    color = '#5e91ae',
    name = 'Lua',
  },
  python = {
    icon = '',
    color = '#5e91ae',
    name = 'Python',
  },
  npm = {
    icon = '',
    color = '#9b3e3e',
    name = 'NPM',
  },
  md = {
    icon = '',
    color = '#5e91ae',
    name = 'Markdown',
  },
  readme = {
    icon = '',
    color = '#5e91ae',
    name = 'Readme',
  },
  changelog = {
    icon = '',
    color = '#5e91ae',
    name = 'Changelog',
  },
  license = {
    icon = '',
    color = '#cbcb41',
    name = 'License',
  },
  js = {
    icon = '',
    color = '#cbcb41',
    name = 'Js',
  },
  specjs = {
    icon = '',
    color = '#d07c44',
    name = 'SpecJs',
  },
  jsx = {
    icon = '',
    color = '#5e91ae',
    name = 'JSX',
  },
  ts = {
    icon = '',
    color = '#5e91ae',
    name = 'Ts',
  },
  spects = {
    icon = '',
    color = '#d07c44',
    name = 'SpecTs',
  },
  tsconfig = {
    icon = '',
    color = '#5e91ae',
    name = 'TsConfig',
  },
  toml = {
    icon = '',
    color = '#41535b',
    name = 'TOML',
  },
  yarnlock = {
    icon = '',
    color = '#5e91ae',
    name = 'YarnLock',
  },
  yml = {
    icon = '',
    color = '#9976bf',
    name = 'YAML',
  },
}

-- Default icon configurations
api.nvim_set_hl(0, 'NvimTreeFileIcon', {
  fg = custom_icons.default.color,
  ctermfg = custom_icons.default.cterm_color,
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
  ['.eslintrc'] = custom_icons.eslint,
  ['.eslintrc.js'] = custom_icons.eslint,
  ['.eslintrc.json'] = custom_icons.eslint,
  ['.gitconfig'] = custom_icons.shell,
  ['.npmrc'] = custom_icons.npm,
  ['.zprofile'] = custom_icons.shell,
  ['.zshenv'] = custom_icons.shell,
  ['.zshrc'] = custom_icons.shell,

  -- Specials
  ['changelog.md'] = custom_icons.changelog,
  ['cmakelists.txt'] = custom_icons.shell,
  ['license.md'] = custom_icons.license,
  ['package-lock.json'] = custom_icons.json,
  ['package.json'] = custom_icons.json,
  ['readme.md'] = custom_icons.readme,

  -- Filetypes
  ['astro'] = custom_icons.astro,
  ['bat'] = custom_icons.shell,
  ['cmake'] = custom_icons.shell,
  ['conf'] = custom_icons.shell,
  ['css'] = custom_icons.css,
  ['gd'] = custom_icons.shell,
  ['ini'] = custom_icons.shell,
  ['jsx'] = custom_icons.jsx,
  ['lua'] = custom_icons.lua,
  ['md'] = custom_icons.md,
  ['mdx'] = custom_icons.md,
  ['py'] = custom_icons.python,
  ['toml'] = custom_icons.toml,
  ['js'] = custom_icons.js,
  ['mjs'] = custom_icons.js,
  ['ts'] = custom_icons.ts,
  ['tsx'] = custom_icons.ts,
  ['yaml'] = custom_icons.yml,
  ['yml'] = custom_icons.yml,

  -- Extensions
  ['spec.js'] = custom_icons.specjs,
  ['test.js'] = custom_icons.specjs,
  ['spec.ts'] = custom_icons.spects,
  ['test.ts'] = custom_icons.spects,
  ['tsconfig.json'] = custom_icons.tsconfig,
  ['yarn.lock'] = custom_icons.yarnlock,
})
