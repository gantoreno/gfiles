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
      vim.g.floaterm_width = vim.api.nvim_win_get_width(0)
      vim.g.floaterm_height = 0.25
      vim.g.floaterm_autoclose = 2
      vim.g.floaterm_wintype = 'split'
      vim.g.floaterm_position = 'rightbelow'
      vim.g.floaterm_keymap_toggle = '<leader>tt'

      vim.api.nvim_command("hi VertSplit guibg=#1b1c1e guifg=#1b1c1e")

      vim.api.nvim_command("hi Floaterm guibg=#1b1c1e")
      vim.api.nvim_command("hi FloatermNC guibg=#1b1c1e")
      vim.api.nvim_command("hi FloatermBorder guibg=#1b1c1e guifg=#61afef")
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

      vim.api.nvim_command("hi TelescopeBorder guifg=#61afef")
      vim.api.nvim_command("hi TelescopePromptBorder guifg=#61afef")
      vim.api.nvim_command("hi TelescopePreviewBorder guifg=#61afef")
      vim.api.nvim_command("hi TelescopeResultsBorder guifg=#61afef")
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
            quit_on_open = true,
          }
        },
        view = {
          width = 35,
          signcolumn = "no"
        },
        update_focused_file = {
          enable = true
        }
      })

      vim.api.nvim_command("hi Directory guibg=#1b1c1e")
    end,
  })

  if packer_bootstrap then
    packer.sync()
  end
end)
