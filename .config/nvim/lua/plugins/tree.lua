return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<leader>nn', '<cmd>NvimTreeToggle<cr>', desc = 'NvimTree' },
    },
    config = function()
      require('nvim-tree').setup({})
    end,
  },
}
