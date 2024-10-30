local M = {}

M.icons = {
  file = '󰈚',
  switch = '',
  close = '󰅖',
}

M.separator = '%='

M.highlight = function(_, hl)
  hl = hl or ''

  return '%#' .. hl .. '#'
end

M.format = function(self, icon, icon_hl, name, active)
  name = #name > 15 and string.sub(name, 1, 15) .. '…' or name

  local tab_length = 22
  local reserved_spaces = 2 + 2 + 2 + 2 + 1

  local hl = active and 'TablineSel' or 'Tabline'

  return table.concat({
    self:highlight(hl),
    ' ',
    self:highlight(icon_hl),
    icon,
    self:highlight(hl),
    ' ',
    name,
    ' ',
    '󰅖',
    ' ',
    self:highlight('TablineFill'),
  })
end

M.offset = function(self)
  local is_tree_visible = require('nvim-tree.api').tree.is_visible()

  if is_tree_visible then
    return table.concat({
      self:highlight('NvimTreeNormal'),
      string.rep(' ', vim.fn.winwidth(1) + 1),
      self:highlight('Tabline'),
    })
  end

  return ''
end

M.buffers = function(self)
  local buffers = {}

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if not vim.api.nvim_buf_is_loaded(buf) then
      goto continue
    end

    local name = vim.api.nvim_buf_get_name(buf)

    if name == '' then
      goto continue
    end

    local filename = vim.fn.fnamemodify(name, ':t')
    local filetype = vim.bo.filetype

    if filetype == 'NvimTree' then
      goto continue
    end

    local icon, hl = require('nvim-web-devicons').get_icon(filename, filetype, { default = true })

    local active = vim.api.nvim_get_current_buf() == buf

    table.insert(buffers, self:format(icon, hl, filename, active))

    ::continue::
  end

  return table.concat(buffers)
end

M.switch = function(self)
  return table.concat({
    self:highlight('StatuslineSecondarySegment'),
    ' ',
    self.icons.switch,
    '  ',
    self:highlight('Statusline'),
  })
end

M.close = function(self)
  return table.concat({
    self:highlight('StatuslineModeReplace'),
    ' ',
    self.icons.close,
    ' ',
    self:highlight('Statusline'),
  })
end

M.render = function(self)
  return table.concat({
    self:offset(),
    self:buffers(),
    self.separator,
    self:switch(),
    self:close(),
  })
end

Bufferline = setmetatable(M, {
  __call = function(statusline)
    return statusline:render()
  end,
})

vim.o.tabline = '%{%v:lua.Bufferline()%}'
