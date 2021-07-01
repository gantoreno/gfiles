local g = vim.g
local fn = vim.fn
local command = vim.api.nvim_command

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  command 'packadd packer.nvim'
end

g.airline_theme = 'startrail'
g.airline_powerline_fonts = true

return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {'gantoreno/vim-startrail', as = 'startrail'}
	use {'kyazdani42/nvim-tree.lua', as = 'nvim-tree'}
	use {'vim-airline/vim-airline', as = 'airline'}
end)

