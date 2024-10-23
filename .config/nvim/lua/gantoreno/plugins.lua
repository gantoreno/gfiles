local fn = vim.fn

local packer = require('packer')

local ensure_packer = function()
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })

    vim.cmd('packadd packer.nvim')

    return true
  end

  return false
end

local packer_bootstrap = ensure_packer()

-- Configure packer
packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
  },
})

return packer.startup(function(use)
  -- Packer itself
  use('wbthomason/packer.nvim')

  -- Colorscheme
  use('~/Developer/Personal/material.nvim')

  -- Editor tools
  use('tpope/vim-surround')
  use('folke/which-key.nvim')
  use('windwp/nvim-autopairs')
  use('terrortylor/nvim-comment')
  use('mhartington/formatter.nvim')

  -- UI elements
  use('voldikss/vim-floaterm')
  use('windwp/nvim-ts-autotag')
  use('stevearc/dressing.nvim')
  use('lewis6991/gitsigns.nvim')
  use('nvim-tree/nvim-tree.lua')
  use('nvim-lualine/lualine.nvim')
  use('norcalli/nvim-colorizer.lua')
  use('lukas-reineke/indent-blankline.nvim')
  use({
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim',
  })
  use({
    'folke/noice.nvim',
    requires = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
  })
  use({
    'MeanderingProgrammer/render-markdown.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  })

  -- Navigation
  use('christoomey/vim-tmux-navigator')

  -- Symbols
  use('nvim-tree/nvim-web-devicons')

  -- Language utilities
  use('SmiteshP/nvim-navic')
  use('onsails/lspkind.nvim')
  use('neovim/nvim-lspconfig')
  use({
    'williamboman/mason-lspconfig.nvim',
    requires = {
      'williamboman/mason.nvim',
    },
  })
  use({
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/playground',
      'nvim-treesitter/nvim-treesitter-context',
    },
    run = ':TSUpdate',
  })
  use({
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'l3mon4d3/luasnip',
      'saadparwaiz1/cmp_luasnip',
    },
  })

  if packer_bootstrap then
    packer.sync()
  end
end)
