return {
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
          prompt_prefix = ' ',
          selection_caret = ' ',
          entry_prefix = ' ',
          preview = true,
          mappings = {
            i = {
              ['<esc>'] = require('telescope.actions').close,
            },
          },
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
