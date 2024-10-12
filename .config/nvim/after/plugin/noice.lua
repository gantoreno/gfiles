require('noice').setup({
  presets = {
    command_palette = true,
    lsp_doc_border = true,
  },
  lsp = {
    hover = {
      opts = {
        border = {
          padding = { 0, 1 },
        },
      },
    },
  },
})
