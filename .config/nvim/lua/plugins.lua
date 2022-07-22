local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

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

  use("nvim-lualine/lualine.nvim")
  use("akinsho/bufferline.nvim")

  use("navarasu/onedark.nvim")

  use("jiangmiao/auto-pairs")
  use("mattn/emmet-vim")

  use({
    "prettier/vim-prettier",
    config = function()
      vim.g["prettier#autoformat"] = false
      vim.g["prettier#quickfix_enabled"] = false
      vim.g["prettier#autoformat_require_pragma"] = false
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
    "glepnir/lspsaga.nvim",
    config = function()
      require("lspsaga").init_lsp_saga({
        code_action_lightbulb = {
          enable = false,
        },
        diagnostic_header = { 
          " ", 
          " ", 
          " ", 
          "ﴞ " 
        },
      })
    end,
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
