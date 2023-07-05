require('telescope').setup({
  defaults = {
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
    },
  },
})
