return {
  {
    'norcalli/nvim-colorizer.lua',
    lazy = false,
    opts = {},
  },
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = 'all',
        highlight = {
          enable = true,
        },
        indentation = {
          enable = true,
        },
      })
    end,
  },
}
