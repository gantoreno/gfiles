return {
  {
    'norcalli/nvim-colorizer.lua',
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    'folke/noice.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    opts = {
      presets = {
        lsp_doc_border = true,
      },
      cmdline = {
        enabled = false,
      },
      notify = {
        enabled = false,
      },
      messages = {
        enabled = false,
      },
      lsp = {
        hover = {
          opts = {
            border = {
              padding = { 0, 0 },
            },
          },
        },
      },
    },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-treesitter/nvim-treesitter',
    },
  },
}
