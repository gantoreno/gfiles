local bufferline = require("bufferline")

local config = {
  options = {
    mode = "tabs",
  },
  highlights = {
    fill = {
      guibg = "#1a1a1c"
    },
    indicator_selected = {
      guifg = "#67afe9",
    }
  }
}

bufferline.setup(config)
