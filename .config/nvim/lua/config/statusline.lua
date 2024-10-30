local M = {}

M.icons = {
  vim = '',
  file = '󰈚',
  folder = '󰉋',
  text = '',
  git = '',
  lsp = '',
  lsp_error = '',
  lsp_warning = '',
  git_added = '',
  git_changed = '',
  git_deleted = '',
}

M.modes = {
  ['n'] = { 'NORMAL', 'StatuslineModeNormal' },
  ['no'] = { 'NORMAL', 'StatuslineModeNormal' },
  ['v'] = { 'VISUAL', 'StatuslineModeVisual' },
  ['V'] = { 'VISUAL LINE', 'StatuslineModeVisual' },
  [''] = { 'VISUAL BLOCK', 'StatuslineModeVisual' },
  ['s'] = { 'SELECT', 'StatuslineModeSelect' },
  ['S'] = { 'SELECT LINE', 'StatuslineModeSelect' },
  [''] = { 'SELECT BLOCK', 'StatuslineModeSelect' },
  ['i'] = { 'INSERT', 'StatuslineModeInsert' },
  ['ic'] = { 'INSERT', 'StatuslineModeInsert' },
  ['R'] = { 'REPLACE', 'StatuslineModeReplace' },
  ['Rv'] = { 'VISUAL REPLACE', 'StatuslineModeReplace' },
  ['c'] = { 'COMMAND', 'StatuslineModeCommand' },
  ['cv'] = { 'VIM EX', 'StatuslineModeEx' },
  ['ce'] = { 'EX', 'StatuslineModeEx' },
  ['r'] = { 'PROMPT', 'StatuslineModePrompt' },
  ['rm'] = { 'MOAR', 'StatuslineModeUnknown' },
  ['r?'] = { 'CONFIRM', 'StatuslineModeUnknown' },
  ['!'] = { 'SHELL', 'StatuslineModeTerminal' },
  ['t'] = { 'TERMINAL', 'StatuslineModeTerminal' },
}

M.separator = '%='

M.highlight = function(_, hl)
  hl = hl or ''

  return '%#' .. hl .. '#'
end

M.segment = function(self, text, hl, opts)
  opts = opts or { padding = {} }

  local lpadding = opts.padding[1] or 1
  local rpadding = opts.padding[2] or 1

  return table.concat({
    self:highlight(hl),
    string.rep(' ', lpadding),
    text,
    string.rep(' ', rpadding),
    self:highlight(),
  })
end

M.mode = function(self)
  local info = self.modes[vim.api.nvim_get_mode().mode]

  local mode = info[1]
  local hl = info[2]

  return self:segment(table.concat({ M.icons.vim, mode }, ' '), hl)
end

M.file = function(self)
  local filename = vim.fn.expand('%:t')
  local filetype = vim.bo.filetype

  local icon = require('nvim-web-devicons').get_icon(filename, filetype) or self.icons.file

  if filename == '' then
    filename = 'Empty'
  end

  return self:segment(table.concat({ icon, filename }, ' '), 'StatuslineSecondarySegment')
end

M.vcs = function(self)
  local signs = vim.b.gitsigns_status_dict or { head = '', added = 0, changed = 0, removed = 0 }

  if signs.head == '' then
    return ''
  end

  return self:segment(
    table.concat({
      self.icons.git,
      signs.head,
      self.icons.git_added,
      signs.added,
      self.icons.git_changed,
      signs.changed,
      self.icons.git_deleted,
      signs.removed,
    }, ' '),
    'Statusline',
    { padding = { 1 } }
  )
end

M.lsp = function(self)
  local clients = vim.lsp.buf_get_clients()

  if next(clients) == nil then
    return ''
  end

  local server = clients[1].name

  return self:segment(
    table.concat({
      self.icons.lsp,
      ' LSP ~',
      server,
    }, ' '),
    'StatuslineLspInfo',
    { padding = { 0, 1 } }
  )
end

M.diagnostics = function(self)
  local result = {}

  local errors = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })

  if #errors > 0 then
    table.insert(result, self:segment(table.concat({ self.icons.lsp_error, #errors }, ' '), 'StatuslineLspError'))
  end

  local warnings = vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })

  if #warnings > 0 then
    table.insert(result, self:segment(table.concat({ self.icons.lsp_warning, #warnings }, ' '), 'StatuslineLspWarning'))
  end

  return self:segment(table.concat(result), 'Statusline', { padding = { 0, 1 } })
end

M.root = function(self)
  local folder = vim.fn.fnamemodify(vim.loop.cwd(), ':t')

  return table.concat({
    self:segment(self.icons.folder, 'StatuslineModeReplace'),
    self:segment(folder, 'StatuslineSecondarySegment'),
  })
end

M.percentage = function(self)
  return table.concat({
    self:segment(self.icons.text, 'StatuslineModeInsert'),
    self:segment('%p%%', 'StatuslineSecondarySegment'),
  })
end

M.render = function(self)
  return table.concat({
    self:mode(),
    self:file(),
    self:vcs(),
    self.separator,
    self:diagnostics(),
    self:lsp(),
    self:root(),
    self:percentage(),
  })
end

Statusline = setmetatable(M, {
  __call = function(statusline)
    return statusline:render()
  end,
})

vim.o.statusline = '%{%v:lua.Statusline()%}'
