local bufferline = require("bufferline")

local config = {
  options = {
    mode = "tabs",
    offsets = {
      {
        filetype = "NvimTree",
        text = "",
        highlight = "Directory",
        text_align = "left",
        padding = 1
      },
    },
  },
  highlights = {
    fill = {
      guibg = "#1b1c1e"
    },
    indicator_selected = {
      guifg = "#67afe9",
    }
  }
}

bufferline.setup(config)
