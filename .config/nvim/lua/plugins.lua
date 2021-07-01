local g = vim.g
local fn = vim.fn
local command = vim.api.nvim_command

g.airline_theme = 'startrail'
g.airline_powerline_fonts = true
g['airline#extensions#tabline#enabled'] = true
g['airline#extensions#tabline#show_splits'] = false
g['airline#extensions#tabline#show_buffers'] = false
g['airline#extensions#tabline#show_close_button'] = false

g.nvim_tree_auto_close = 1
g.nvim_tree_update_cwd = 1
g.nvim_tree_quit_on_open = 1
g.nvim_tree_indent_markers = 0

g.indentLine_char = '│'
g.indent_blankline_space_char = ' '
g.indent_blankline_filetype_exclude = {
  'term',
  'packer',
  'NvimTree'
}
g.indent_blankline_show_first_indent_level = true
g.indent_blankline_show_trailing_blankline_indent = false

g.signify_sign_add='┃'
g.signify_sign_delete='┃'
g.signify_sign_change='┃'
g.signify_sign_changedelete='┃'
g.signify_sign_delete_first_line='┃'
g.signify_sign_show_count=false

g['prettier#autoformat'] = true

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  command 'packadd packer.nvim'
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'ryanoasis/vim-devicons'
  use 'kyazdani42/nvim-web-devicons'
  

  use {'sheerun/vim-polyglot', as = 'polyglot'}
  use {'nvim-lua/popup.nvim', as = 'popup'}
  use {'nvim-lua/plenary.nvim', as = 'plenary'}
  use {'nvim-telescope/telescope.nvim', as = 'telescope'}
  use {'tomtom/tcomment_vim', as = 'tcomment'}

  use {'mattn/emmet-vim', as = 'emmet'}
  use {'mhinz/vim-signify', as = 'signify'}
  use {'gantoreno/vim-startrail', as = 'startrail'}
  use {'kyazdani42/nvim-tree.lua', as = 'nvim-tree'}
  use {'vim-airline/vim-airline', as = 'airline'}
  use {'prettier/vim-prettier', run = 'yarn-install'}
  use {'jiangmiao/auto-pairs', as = 'autopairs'}
  use {'lukas-reineke/indent-blankline.nvim', branch = 'lua' }
end)

