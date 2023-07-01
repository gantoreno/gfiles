local fn = vim.fn
local cmd = vim.cmd
local command = vim.api.nvim_command

-- Make sure packer is installed
local ensure_packer = function()
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })

    cmd('packadd packer.nvim')

    return true
  end

  return false
end

local packer_bootstrap = ensure_packer()

-- Configure packer
command("packadd packer.nvim")

require('packer').startup(function(use)
  -- Colorscheme
  use('/Users/gabrielmoreno/Developer/Personal/vim-gabriel')

  -- Packer itself
  use('wbthomason/packer.nvim')

  -- Editor tools
  use('windwp/nvim-autopairs')
  use('terrortylor/nvim-comment')

  -- UI elements
  use('voldikss/vim-floaterm')
  use('nvim-tree/nvim-tree.lua')
  use({
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim',
  })

  -- Symbols
  use('mhinz/vim-signify')
  use('nvim-tree/nvim-web-devicons')

  -- Language utilities
  use('neovim/nvim-lspconfig')
  use('mhartington/formatter.nvim')
  use({ 'nvim-treesitter/nvim-treesitter', requires = 'nvim-treesitter/playground', run = ':TSUpdate' })
  use({
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
    },
  })

  -- Environment variables
  use('laytan/cloak.nvim')

  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Plugin configuration
require("nvim-autopairs").setup({ check_ts = true })

require("nvim_comment").setup({})

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

require('telescope').setup({
  defaults = {
    layout_strategy = 'vertical',
    mappings = {
      i = {
        ['<esc>'] = require('telescope.actions').close
      }
    },
    file_ignore_patterns = { 'node_modules', '.git', 'build', 'static' },
  },
})

require('nvim-web-devicons').setup({
  strict = true,
  default = true,
  override_by_extension = {
    ["astro"] = {
      icon = "󰑣",
      color = "#e0622a",
      name = "Astro"
    }
  },
})

require('lspconfig.ui.windows').default_options.border = 'rounded'

require('nvim-treesitter.configs').setup({
  ensure_installed = 'all',
  indent = { enable = true },
  highlight = { enable = true },
})

require('formatter').setup({
  filetype = {
    javascript = { require('formatter.filetypes.javascript').prettier },
    javascriptreact = { require('formatter.filetypes.javascriptreact').prettier },
    typescript = { require('formatter.filetypes.typescript').prettier },
    typescriptreact = { require('formatter.filetypes.typescriptreact').prettier },
  }
})

require('cloak').setup({})
