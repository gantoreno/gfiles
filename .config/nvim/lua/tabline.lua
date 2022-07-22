local bufferline = require("bufferline")

local config = {
  options = {
    mode = "tabs",
  },
  highlights = {
    fill = {
      guibg = "#1a1a1c"
    }
  }
}

bufferline.setup(config)

