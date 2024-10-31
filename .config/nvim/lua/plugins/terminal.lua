return {
  {
    'voldikss/vim-floaterm',
    config = function()
      vim.g.floaterm_borderchars = '─│─│╭╮╯╰'
      vim.g.floaterm_shell = 'NEOVIM=1 /usr/bin/env zsh'
      vim.g.floaterm_height = 0.25
      vim.g.floaterm_autoclose = 2
      vim.g.floaterm_wintype = 'split'
      vim.g.floaterm_position = 'botright'
      vim.g.floaterm_title = ' Floaterm '
      vim.g.floaterm_titleposition = 'center'
    end,
  },
}
