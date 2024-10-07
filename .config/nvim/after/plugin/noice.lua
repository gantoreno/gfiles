require('noice').setup({
  presets = {
    command_palette = true,
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
