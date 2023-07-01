local fn = vim.fn
local cmd = vim.cmd
local command = vim.api.nvim_command

-- Make sure packer is installed
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
  -- Colorscheme
  use('/Users/gabrielmoreno/Developer/Personal/vim-gabriel')

  -- Packer itself
  use('wbthomason/packer.nvim')

  -- Editor tools
  use('windwp/nvim-autopairs')
  use('terrortylor/nvim-comment')

  -- UI elements
  use('voldikss/vim-floaterm')
  use('nvim-tree/nvim-tree.lua')
  use({
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim',
  })

  -- Symbols
  use('mhinz/vim-signify')
  use('nvim-tree/nvim-web-devicons')

  -- Language utilities
  use('neovim/nvim-lspconfig')
  use('mhartington/formatter.nvim')
  use({ 'nvim-treesitter/nvim-treesitter', requires = 'nvim-treesitter/playground', run = ':TSUpdate' })
  use({
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
    },
  })

  -- Environment variables
  use('laytan/cloak.nvim')

  if packer_bootstrap then
    require('packer').sync()
  end
end)
