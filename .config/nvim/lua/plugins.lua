--    ______      __         _      __   Gabriel Moreno
--   / ____/___ _/ /_  _____(_)__  / /   ==============
--  / / __/ __ `/ __ \/ ___/ / _ \/ /    E-mail:   gantoreno@gmail.com
-- / /_/ / /_/ / /_/ / /  / /  __/ /     Website:  https://gantoreno.com
-- \____/\__,_/_.___/_/  /_/\___/_/      GitHub:   https://github.com/gantoreno
--
-- Neovim plugins file

-- Variables {{{
local fn = vim.fn
local command = vim.api.nvim_command

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
-- }}}

-- Packer {{{
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  command("packadd packer.nvim")
end

return require("packer").startup(function(use)
  -- Packer {{{
  use("wbthomason/packer.nvim")
  -- }}}

  -- Colorscheme {{{
  use("gantoreno/vim-startrail")
  -- }}}

  -- Devicons {{{
  use("ryanoasis/vim-devicons")
  use("kyazdani42/nvim-web-devicons")
  -- }}}

  -- Fuzzy finding {{{
  use("nvim-lua/popup.nvim")
  use("nvim-lua/plenary.nvim")
  use({
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = { i = { ["<esc>"] = require("telescope.actions").close } },
          borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
          file_ignore_patterns = { "node_modules", ".git" },
        },
      })
    end,
  })
  -- }}}

  -- Commenting {{{
  use("tomtom/tcomment_vim")
  -- }}}

  -- Snippets & formatting{{{
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
    "jiangmiao/auto-pairs",
    config = function()
      vim.g.AutoPairsShortcutToggle = ""
    end,
  })
  -- }}}

  -- Editor tools {{{
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({})
    end,
  })
  use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install" })
  use({
    "glepnir/dashboard-nvim",
    config = function()
      vim.g.dashboard_custom_header = {
        "   ______      __         _      __",
        "  / ____/___ _/ /_  _____(_)__  / /",
        " / / __/ __ `/ __ \\/ ___/ / _ \\/ / ",
        "/ /_/ / /_/ / /_/ / /  / /  __/ /  ",
        "\\____/\\__,_/_.___/_/  /_/\\___/_/   ",
      }
      vim.g.dashboard_custom_section = {
        a = {
          description = { "  Find File          " },
          command = "Telescope find_files",
        },
        b = {
          description = { "  Recently Seen Files" },
          command = "Telescope oldfiles",
        },
        c = {
          description = { "  Load Last Session  " },
          command = "SessionLoad",
        },
        d = {
          description = { "  Find Word          " },
          command = "Telescope live_grep",
        },
        e = {
          description = { "  Neovim Config Files" },
          command = "lua require('telescope.builtin').find_files({search_dirs = {'"
            .. os.getenv("HOME")
            .. "/.config/nvim'}})",
        },
      }
      vim.g.dashboard_custom_footer = {
        " The nitrogen in our DNA, the calcium in our teeth, the iron in our blood,  ",
        "the carbon in our apple pies were made in the interiors of collapsing stars.",
        "                         We are made of starstuff.                          ",
        "",
        "                                - Carl Sagan                                ",
      }
      vim.g.dashboard_default_executive = "telescope"
    end,
  })
  use({
    "mhinz/vim-signify",
    config = function()
      vim.g.signify_sign_add = "┃"
      vim.g.signify_sign_delete = "┃"
      vim.g.signify_sign_change = "┃"
      vim.g.signify_sign_changedelete = "┃"
      vim.g.signify_sign_delete_first_line = "┃"
      vim.g.signify_sign_show_count = false
    end,
  })
  use({
    "kyazdani42/nvim-tree.lua",
    config = function()
      vim.g.nvim_tree_width = 40
      vim.g.nvim_tree_follow = 1
      vim.g.nvim_tree_ignore = { ".git" }
      vim.g.nvim_tree_auto_close = true
      vim.g.nvim_tree_update_cwd = 1
      vim.g.nvim_tree_quit_on_open = 1
      vim.g.nvim_tree_indent_markers = 0

      require("nvim-tree.view").View.winopts.signcolumn = "no"
    end,
  })
  use({
    "vim-airline/vim-airline",
    config = function()
      vim.g.airline_theme = "startrail"
      vim.g.airline_powerline_fonts = true
      vim.g["airline#extensions#tabline#enabled"] = true
      vim.g["airline#extensions#tabline#show_splits"] = false
      vim.g["airline#extensions#tabline#show_buffers"] = false
      vim.g["airline#extensions#tabline#show_close_button"] = false
    end,
  })
  use({
    "lukas-reineke/indent-blankline.nvim",
    setup = function()
      vim.g.indentLine_char = "▏"
      vim.g.indent_blankline_space_char = " "
      vim.g.indent_blankline_filetype_exclude = {
        "help",
        "term",
        "packer",
        "dashboard",
        "NvimTree",
      }
      vim.g.indent_blankline_show_first_indent_level = true
      vim.g.indent_blankline_show_trailing_blankline_indent = false
    end,
  })
  -- }}}

  -- LSP & Completion {{{
  use({
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.protocol.CompletionItemKind = {
        " (Text) ",
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
    end,
  })
  use({
    "glepnir/lspsaga.nvim",
    config = function()
      require("lspsaga").init_lsp_saga({
        code_action_prompt = {
          enable = false,
        },
        error_sign = "",
        warn_sign = "",
        hint_sign = "",
        infor_sign = "",
      })
    end,
  })
  use({
    "hrsh7th/nvim-compe",
    config = function()
      vim.g.completion_matching_strategy_list = { "exact", "substring", "fuzzy" }
    end,
  })
  use({ "creativenull/diagnosticls-nvim" })
  -- }}}

  -- Highlighting {{{
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  -- }}}
end)
-- }}}
