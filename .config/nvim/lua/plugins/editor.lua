return {
  {
    'tpope/vim-surround',
  },
  {
    'windwp/nvim-autopairs',
    opts = {
      check_ts = true,
    },
  },
  {
    'windwp/nvim-ts-autotag',
    opts = {
      filetypes = {
        'astro',
        'html',
        'javascript',
        'typescript',
        'javascriptreact',
        'typescriptreact',
        'svelte',
        'vue',
        'tsx',
        'jsx',
        'rescript',
      },
    },
  },
}
