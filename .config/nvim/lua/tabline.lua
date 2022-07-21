local bufferline = require("bufferline")

local config = {
  options = {
    mode = "tabs",
  },
  highlights = {
    fill = {
      guibg = "#202328"
    }
  }
}

bufferline.setup(config)

