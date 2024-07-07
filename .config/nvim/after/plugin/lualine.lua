local colors = require "material.colors"

local m = colors.main
local e = colors.editor

e.accent = m.blue

local theme = {
  normal = {
    a = { fg = e.bg, bg = e.accent, gui = "bold" },
    b = { fg = e.title, bg = e.selection },
    c = { fg = e.fg, bg = e.bg_alt },
  },
  insert = {
    a = { fg = e.bg, bg = m.green, gui = "bold" },
    b = { fg = e.title, bg = e.selection },
  },
  visual = {
    a = { fg = e.bg, bg = m.purple, gui = "bold" },
    b = { fg = e.title, bg = e.selection },
  },
  replace = {
    a = { fg = e.bg, bg = m.red, gui = "bold" },
    b = { fg = e.title, bg = e.selection },
  },
  command = {
    a = { fg = e.bg, bg = m.yellow, gui = "bold" },
    b = { fg = e.title, bg = e.selection },
  },
  inactive = {
    a = { fg = e.disabled, bg = e.bg },
    b = { fg = e.disabled, bg = e.bg },
    c = { fg = e.disabled, bg = e.bg }
  }
}

require('lualine').setup({
  options = {
    theme = theme
  }
})
