local g = vim.g

local command = vim.api.nvim_command

-- Configure packer
command("packadd packer.nvim")

require('packer').startup(function(use)
  -- Packer
  use('wbthomason/packer.nvim')

  -- Colorscheme
  use('gantoreno/vim-gabriel')

  -- Interactions
  use({
    'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup({ check_ts = true })
    end
  })
  use({
    'terrortylor/nvim-comment',
    config = function()
      require("nvim_comment").setup({})
    end
  })

  -- File navigation
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
          mappings = { 
            i = { ['<esc>'] = require('telescope.actions').close } 
          },
          file_ignore_patterns = { 'node_modules', '.git', 'build' },
        },
      })
    end
  })

  -- Git
  use('mhinz/vim-signify')

  -- Terminal
  use('voldikss/vim-floaterm')
 
  -- Treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    requires = 'nvim-treesitter/playground',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = 'all',
        indent = { enable = false },
        highlight = { enable = true },
      })
    end
  })

  -- Icons
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
        };
      })
    end
  })
end)
