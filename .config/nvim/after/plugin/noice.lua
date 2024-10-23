require('noice').setup({
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
  routes = {
    {
      filter = {
        event = 'notify',
        find = 'No information available',
      },
      opts = { skip = true },
    },
  },
})