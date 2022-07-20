local o = vim.o
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 
    'git', 
    'clone', 
    '--depth', 
    '1', 
    'https://github.com/wbthomason/packer.nvim', 
    install_path 
  })
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  use({
    "navarasu/onedark.nvim",
    config = function() 
      require("onedark").setup({
        style = "warmer",
        code_style = {
          comments = 'none'
        }
      })
      require("onedark").load()
    end
  })

  use({
    "kyazdani42/nvim-tree.lua",
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require("nvim-tree").setup({
        actions = {
          open_file = {
            quit_on_open = true
          }
        },
        view = {
          adaptive_size = true,
          signcolumn = "no"
        },
        update_focused_file = {
          enable = true
        }
      })
    end,
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
