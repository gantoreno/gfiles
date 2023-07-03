local highlight = require('gantoreno.utils.highlights')

local M = {}

M.get_icon = function(bufname, extension)
  local ok, web = pcall(require, 'nvim-web-devicons')
  local filename = vim.fn.fnamemodify(bufname, ':t')

  if ok then
    local icon, hl = web.get_icon(filename, extension, { default = true })

    return highlight.with_highlight_group(icon, hl)
  end

  return nil
end

return M
