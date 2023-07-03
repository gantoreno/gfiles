local M = {}

M.get_tab_name = function(bufname, index)
  local title = vim.fn.gettabvar(index, 'TablineTitle')

  if title ~= vim.NIL and title ~= '' then
    return title
  end

  if bufname == '' then
    return "[No Name]"
  end

  return vim.fn.fnamemodify(bufname, ':t')
end

return M
