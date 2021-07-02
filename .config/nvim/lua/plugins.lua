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
-- }}}

-- Packer {{{
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  command 'packadd packer.nvim'
end

return require('packer').startup(function()
  -- Packer {{{
  use 'wbthomason/packer.nvim'
  -- }}}

  -- Colorscheme {{{
  use 'gantoreno/vim-startrail'
  -- }}}

  -- Devicons {{{
  use 'ryanoasis/vim-devicons'
  use 'kyazdani42/nvim-web-devicons'
  -- }}}
  
  -- Fuzzy finding {{{
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  -- }}}

  -- Commenting {{{
  use 'tomtom/tcomment_vim'
  -- }}}

  -- Snippets {{{
  use 'mattn/emmet-vim'
  use {
    'prettier/vim-prettier',
    config = function()
      vim.g['prettier#autoformat'] = true
      vim.g['prettier#quickfix_enabled'] = false
      vim.g['prettier#autoformat_require_pragma'] = false
    end
  }
  use {
    'jiangmiao/auto-pairs',
    config = function()
      vim.g.AutoPairsShortcutToggle = '' 
    end
  }
  -- }}}

  -- Editor tools {{{
  use 'chrisbra/Colorizer'
  use {
    'mhinz/vim-signify', 
    config = function()
      vim.g.signify_sign_add='┃'
      vim.g.signify_sign_delete='┃'
      vim.g.signify_sign_change='┃'
      vim.g.signify_sign_changedelete='┃'
      vim.g.signify_sign_delete_first_line='┃'
      vim.g.signify_sign_show_count=false
    end
  }
  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      vim.g.nvim_tree_auto_close = true
      vim.g.nvim_tree_update_cwd = 1
      vim.g.nvim_tree_quit_on_open = 1
      vim.g.nvim_tree_indent_markers = 0
    end
  }
  use {
    'vim-airline/vim-airline', 
    config = function()
      vim.g.airline_theme = 'startrail'
      vim.g.airline_powerline_fonts = true
      vim.g['airline#extensions#tabline#enabled'] = true
      vim.g['airline#extensions#tabline#show_splits'] = false
      vim.g['airline#extensions#tabline#show_buffers'] = false
      vim.g['airline#extensions#tabline#show_close_button'] = false
    end
  }
  use {
    'lukas-reineke/indent-blankline.nvim', 
    branch = 'lua',
    setup = function()
      vim.g.indentLine_char = '│'
      vim.g.indent_blankline_space_char = ' '
      vim.g.indent_blankline_filetype_exclude = {
        'help',
        'term',
        'packer',
        'NvimTree'
      }
      vim.g.indent_blankline_show_first_indent_level = true
      vim.g.indent_blankline_show_trailing_blankline_indent = false
    end
  }
  -- }}}

  -- LSP & Completion {{{
  use 'neovim/nvim-lspconfig'
  use {
    'glepnir/lspsaga.nvim',
    config = function()
      require'lspsaga'.init_lsp_saga {
        error_sign = '',
        warn_sign = '',
        hint_sign = '',
        infor_sign = '',
      }
    end
  }
  use {
    'hrsh7th/nvim-compe',
    config = function()
      vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
    end
  }
  -- }}}

  -- Highlighting {{{
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  -- }}}
end)
-- }}}

