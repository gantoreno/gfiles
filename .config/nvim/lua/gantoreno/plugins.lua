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
    end
  }
})

return packer.startup(function(use)
  -- Colorscheme
  use('~/Developer/Personal/nvim-gabriel')

  -- Packer itself
  use('wbthomason/packer.nvim')

  -- Editor tools
  use('itchyny/vim-gitbranch')
  use('windwp/nvim-autopairs')
  use({
    'numtostr/comment.nvim',
    requires = 'JoosepAlviste/nvim-ts-context-commentstring'
  })

  -- UI elements
  use('SmiteshP/nvim-navic')
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
  use('jose-elias-alvarez/null-ls.nvim')
  use('mhartington/formatter.nvim')
  use({ 'nvim-treesitter/nvim-treesitter', requires = 'nvim-treesitter/playground', run = ':TSUpdate' })
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