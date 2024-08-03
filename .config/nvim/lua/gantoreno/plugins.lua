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
  -- Colorscheme
  use('marko-cerovac/material.nvim')
  use('Mofiqul/vscode.nvim')
  use('sainnhe/sonokai')
  use('folke/tokyonight.nvim')
  use('rebelot/kanagawa.nvim')
  use('navarasu/onedark.nvim')

  -- Packer itself
  use('wbthomason/packer.nvim')

  -- Editor tools
  use('tpope/vim-surround')
  use('itchyny/vim-gitbranch')
  use('windwp/nvim-autopairs')
  use('terrortylor/nvim-comment')

  -- UI elements
  use('lewis6991/gitsigns.nvim')
  use('voldikss/vim-floaterm')
  use('akinsho/toggleterm.nvim')
  use('nvim-tree/nvim-tree.lua')
  use('nvim-lualine/lualine.nvim')
  use('norcalli/nvim-colorizer.lua')
  use('lukas-reineke/indent-blankline.nvim')
  use({
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim',
  })

  -- Navigation
  use('christoomey/vim-tmux-navigator')

  -- Symbols
  use('nvim-tree/nvim-web-devicons')

  -- Language utilities
  use('onsails/lspkind.nvim')
  use('neovim/nvim-lspconfig')
  use('marilari88/twoslash-queries.nvim')
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

  -- Environment variables
  use('laytan/cloak.nvim')

  if packer_bootstrap then
    packer.sync()
  end
end)
