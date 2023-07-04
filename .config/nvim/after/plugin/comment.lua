require('Comment').setup({
  toggler = {
    line = '<C-/>',
  },
  opleader = {
    line = '<C-/>',
  },
  pre_hook = function(ctx)
    local utils = require('Comment.utils')
    local location = nil

    if ctx.ctype == utils.ctype.block then
      location = require('ts_context_commentstring.utils').get_cursor_location()
    elseif ctx.cmotion == utils.cmotion.v or ctx.motion == utils.cmotion.V then
      location = require('ts_context_commentstring.utils').get_visual_start_location()
    end

    return require('ts_context_commentstring.internal').calculate_commentstring({
      key = ctx.ctype == utils.ctype.line and '__default' or '__multiline',
      location = location,
    })
  end,
})
