local onedark = require("onedark")

local config = {
  style = "warmer",
}

onedark.setup(config)
onedark.load()

vim.api.nvim_command("hi TelescopeBorder guifg=#61afef")
vim.api.nvim_command("hi TelescopePromptBorder guifg=#61afef")
vim.api.nvim_command("hi TelescopePreviewBorder guifg=#61afef")
vim.api.nvim_command("hi TelescopeResultsBorder guifg=#61afef")
