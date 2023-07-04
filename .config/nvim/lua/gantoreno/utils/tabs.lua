local fn = vim.fn

local M = {}

M.get_tab_name = function(bufname, index)
  local title = fn.gettabvar(index, 'TablineTitle')

  if title ~= nil and title ~= '' then
    return title
  end

  if bufname == '' then
    return '[No Name]'
  end

  return fn.fnamemodify(bufname, ':t')
end

return M
