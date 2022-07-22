local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

local packer_bootstrap

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
end

local packer = require("packer")

return packer.startup(function(use)
  use("wbthomason/packer.nvim")

  use("nvim-lua/popup.nvim")
  use("nvim-lua/plenary.nvim")

  use("nvim-lualine/lualine.nvim")
  use("akinsho/bufferline.nvim")

  use("navarasu/onedark.nvim")

  use("jiangmiao/auto-pairs")
  use("tomtom/tcomment_vim")
  use("mattn/emmet-vim")

  use({
    "voldikss/vim-floaterm",
    config = function()
      vim.g.floaterm_shell = 'NEOVIM=1 /bin/zsh'
      vim.g.floaterm_height = 0.25
      vim.g.floaterm_autoclose = 2
      vim.g.floaterm_wintype = 'split'
      vim.g.floaterm_position = 'botright'
      vim.g.floaterm_keymap_toggle = '<leader>tt'
    end
  })

  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  })

  use({
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = { i = { ["<esc>"] = require("telescope.actions").close } },
          file_ignore_patterns = { "node_modules", ".git" },
        },
      })
    end,
  })

  use({
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.protocol.CompletionItemKind = {
        " (Text)",
        " (Method)",
        " (Function)",
        " (Constructor)",
        "ﴲ (Field)",
        " (Variable)",
        " (Class)",
        "ﰮ (Interface)",
        " (Module)",
        "襁(Property)",
        " (Unit)",
        " (Value)",
        "練(Enum)",
        " (Keyword)",
        " (Snippet)",
        " (Color)",
        " (File)",
        " (Reference)",
        " (Folder)",
        " (EnumMember)",
        "ﲀ (Constant)",
        "ﳤ (Struct)",
        " (Event)",
        " (Operator)",
        " (TypeParameter)",
      }
    end
  })

  use({
    "hrsh7th/nvim-compe",
    config = function()
      vim.g.completion_matching_strategy_list = {
        "exact",
        "substring",
        "fuzzy"
      }
    end,
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
        highlight = {
          enable = true
        },
        indent = {
          enable = true
        }
      })
    end
  })

  use({
    "kyazdani42/nvim-tree.lua",
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require("nvim-tree").setup({
        actions = {
          open_file = {
            quit_on_open = true
          }
        },
        view = {
          signcolumn = "no"
        },
        update_focused_file = {
          enable = true
        }
      })
    end,
  })

  if packer_bootstrap then
    packer.sync()
  end
end)
