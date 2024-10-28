return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<leader>nn', '<cmd>NvimTreeToggle<cr>', desc = 'NvimTree' },
    },
    config = function()
      require('nvim-tree').setup({
        filters = { dotfiles = false },
        disable_netrw = true,
        hijack_cursor = true,
        sync_root_with_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = false,
        },
        view = {
          width = 30,
          preserve_window_proportions = true,
        },
      })
    end,
  },
}
