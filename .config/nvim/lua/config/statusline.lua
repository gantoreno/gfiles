local modes = {
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

local function with_highlight_group(text, hl, opts)
  local opts = opts or {}

  local lpadding = opts['padding'][1] or 0
  local rpadding = opts['padding'][2] or 0

  return '%#' .. hl .. '#' .. string.rep(' ', lpadding) .. text .. string.rep(' ', rpadding) .. '%##'
end

function Statusline()
  local info = modes[vim.api.nvim_get_mode().mode]
  local mode = info[1]
  local hl = info[2]

  local filename = vim.fn.expand('%:t')
  local filetype = vim.bo.filetype

  local icon = require('nvim-web-devicons').get_icon(filename, filetype) or '󰦨'

  if filename == '' then
    filename = 'No name'
  end

  return with_highlight_group(' ' .. mode, hl, { padding = { 1, 1 } })
    .. with_highlight_group(icon .. ' ' .. filename, 'StatuslineSecondarySegment', { padding = { 1, 1 } })
end

vim.o.statusline = '%{%v:lua.Statusline()%}'
