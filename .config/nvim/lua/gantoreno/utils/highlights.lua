local M = {}

M.with_highlight_group = function(text, hl)
  return table.concat { '%#', hl, "#", text, '%##' }
end

return M
