require('telescope').setup({
  defaults = {
    prompt_prefix = ' ',
    selection_caret = ' ',
    entry_prefix = ' ',
    preview = false,
    layout_strategy = 'vertical',
    sorting_strategy = 'ascending',
    layout_config = {
      vertical = {
        prompt_position = 'top',
        width = 0.6,
      },
    },
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
