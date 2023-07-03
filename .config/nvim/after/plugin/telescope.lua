require('telescope').setup({
  defaults = {
    layout_strategy = 'vertical',
    mappings = {
      i = {
        ['<esc>'] = require('telescope.actions').close
      }
    },
    file_ignore_patterns = { 'node_modules', '.git', 'build', 'static', '.oh-my-zsh' },
  },
})
