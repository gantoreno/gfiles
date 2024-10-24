require('noice').setup({
  presets = {
    lsp_doc_border = true,
  },
  cmdline = {
    enabled = false,
  },
  messages = {
    enabled = false,
  },
  popmenu = {
    enabled = false,
  },
  notify = {
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
  routes = {
    {
      filter = {
        event = 'notify',
        find = 'No information available',
      },
      opts = {
        skip = true,
      },
    },
  },
})
