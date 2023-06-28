local fn = vim.fn
local cmd = vim.cmd
local command = vim.api.nvim_command

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
  use('/Users/gabrielmoreno/Developer/Personal/vim-gabriel')

  use({
    'wbthomason/packer.nvim',
    config = function()
      require("nvim-autopairs").setup({ check_ts = true })
    end
  })

  use('windwp/nvim-autopairs')
  use({
    'terrortylor/nvim-comment',
    config = function()
      require("nvim_comment").setup({})
    end
  })

  use({
    'nvim-tree/nvim-tree.lua',
    config = function()
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
    end
  })

  use({
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
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
    end
  })

  use('mhinz/vim-signify')
  use({
    'nvim-tree/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup({
        strict = true,
        override_by_extension = {
          ["astro"] = {
            icon = "󰑣",
            color = "#e0622a",
            name = "Astro"
          }
        },
      })
    end
  })

  use('voldikss/vim-floaterm')

  use({
    'neovim/nvim-lspconfig',
    config = function()
      require('lspconfig.ui.windows').default_options.border = 'rounded'
    end
  })

  use({
    'hrsh7th/nvim-cmp',
    requires = 'hrsh7th/cmp-nvim-lsp',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = 'all',
        indent = { enable = true },
        highlight = { enable = true },
      })
    end
  })

  use({ 'nvim-treesitter/nvim-treesitter', requires = 'nvim-treesitter/playground', run = ':TSUpdate' })

  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Plugin configuration
