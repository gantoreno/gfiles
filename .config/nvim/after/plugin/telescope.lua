require('telescope').setup({
  defaults = {
    prompt_prefix = ' ',
    selection_caret = ' ',
    entry_prefix = ' ',
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
