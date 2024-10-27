return {
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      presets = {
        command_palette = true,
        lsp_doc_border = true,
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
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
  },
}
