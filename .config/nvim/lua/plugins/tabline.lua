local editor = require('earthbound.palettes.earthbound').editor
local syntax = require('earthbound.palettes.earthbound').syntax
local colors = require('earthbound.palettes.earthbound').colors

return {
  {
    'akinsho/bufferline.nvim',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local bufferline = require('bufferline')

      bufferline.setup({
        options = {
          mode = 'tabs',
          style_preset = {
            bufferline.style_preset.no_bold,
            bufferline.style_preset.no_italic,
          },
          offsets = {
            {
              filetype = 'NvimTree',
              text_align = 'left',
              separator = true,
              highlight = 'BufferLineOffset',
            },
          },
        },
        highlights = {
          fill = {
            bg = editor.highlight,
          },
          background = {
            bg = editor.highlight,
          },
          separator = {
            fg = editor.highlight,
            bg = editor.highlight,
          },
          separator_visible = {
            fg = editor.highlight,
            bg = editor.highlight,
          },
          separator_selected = {
            fg = editor.highlight,
            bg = editor.highlight,
          },
          close_button = {
            fg = syntax.disabled,
            bg = editor.highlight,
          },
          close_button_visible = {
            fg = syntax.disabled,
            bg = editor.highlight,
          },
          close_button_selected = {
            fg = colors.red,
          },
          indicator_visible = {
            fg = editor.highlight,
          },
          indicator_selected = {
            fg = editor.background,
          },
          modified = {
            fg = colors.green,
          },
          modified_visible = {
            fg = colors.green,
          },
          modified_selected = {
            fg = colors.green,
          },
          offset_separator = {
            fg = editor.sidebar,
            bg = editor.sidebar,
          },
        },
      })
    end,
  },
}
