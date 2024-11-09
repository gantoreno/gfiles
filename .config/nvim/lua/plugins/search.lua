return {
  {
    'MagicDuck/grug-far.nvim',
    main = 'grug-far',
    opts = {},
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require('telescope').setup({
        pickers = {
          find_files = { hidden = true },
          live_grep = { hidden = true },
        },
        defaults = {
          prompt_prefix = '   ',
          selection_caret = ' ',
          entry_prefix = ' ',
          file_ignore_patterns = {
            'node_modules',
            '.git',
            'build',
            'static',
            '.oh%-my%-zsh',
            '.tmux/',
          },
        },
      })
    end,
  },
}
