--    ______      __         _      __   Gabriel Moreno
--   / ____/___ _/ /_  _____(_)__  / /   ==============
--  / / __/ __ `/ __ \/ ___/ / _ \/ /    E-mail:   gantoreno@gmail.com
-- / /_/ / /_/ / /_/ / /  / /  __/ /     Website:  https://gantoreno.com
-- \____/\__,_/_.___/_/  /_/\___/_/      GitHub:   https://github.com/gantoreno
-- 
-- Neovim plugins file

-- Variables {{{
local g = vim.g
local fn = vim.fn
local command = vim.api.nvim_command
-- }}}

-- Airline options {{{
g.airline_theme = 'startrail'
g.airline_powerline_fonts = true
g['airline#extensions#tabline#enabled'] = true
g['airline#extensions#tabline#show_splits'] = false
g['airline#extensions#tabline#show_buffers'] = false
g['airline#extensions#tabline#show_close_button'] = false
  -- }}}

-- NvimTree {{{
g.nvim_tree_auto_close = 1
g.nvim_tree_update_cwd = 1
g.nvim_tree_quit_on_open = 1
g.nvim_tree_indent_markers = 0
-- }}}

-- Indent blankline {{{
g.indentLine_char = '│'
g.indent_blankline_space_char = ' '
g.indent_blankline_filetype_exclude = {
  'help',
  'term',
  'packer',
  'NvimTree'
}
g.indent_blankline_show_first_indent_level = true
g.indent_blankline_show_trailing_blankline_indent = false
-- }}}

-- Signify {{{
g.signify_sign_add='┃'
g.signify_sign_delete='┃'
g.signify_sign_change='┃'
g.signify_sign_changedelete='┃'
g.signify_sign_delete_first_line='┃'
g.signify_sign_show_count=false
-- }}}

-- Prettier {{{
g['prettier#autoformat'] = true
g['prettier#autoformat_require_pragma'] = false

g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
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
  use 'prettier/vim-prettier'
  use 'jiangmiao/auto-pairs'
  -- }}}

  -- Editor tools {{{
  use 'mhinz/vim-signify'
  use 'kyazdani42/nvim-tree.lua'
  use 'vim-airline/vim-airline'
  use {'lukas-reineke/indent-blankline.nvim', branch = 'lua' }
  -- }}}

  -- LSP & Completion {{{
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  -- }}}

  -- Highlighting {{{
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  -- }}}
end)
-- }}}

