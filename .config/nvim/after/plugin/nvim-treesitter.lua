require('nvim-treesitter.configs').setup({
  ensure_installed = 'all',
  autopairs = { enable = true },
  indent = { enable = true },
  highlight = { enable = true },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
})

require('treesitter-context').setup({
  enable = true,
  mode = 'topline',
})
