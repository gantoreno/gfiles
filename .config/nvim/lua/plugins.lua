local g = vim.g

local command = vim.api.nvim_command

-- Configure packer
command("packadd packer.nvim")

require('packer').startup(function(use)
  -- Packer
  use('wbthomason/packer.nvim')

  -- Colorscheme
  use('gantoreno/vim-gabriel')

  -- Interactions
  use('windwp/nvim-autopairs')
  use('terrortylor/nvim-comment')

  -- File navigation
  use('nvim-tree/nvim-tree.lua')
  use({ 
    'nvim-telescope/telescope.nvim', 
    requires = 'nvim-lua/plenary.nvim',
  })

  -- Git
  use('mhinz/vim-signify')

  -- Terminal
  use('voldikss/vim-floaterm')
 
  -- Treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    requires = 'nvim-treesitter/playground',
    run = ':TSUpdate',
  })

  -- Icons
  use('nvim-tree/nvim-web-devicons')
end)
