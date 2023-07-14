local o = vim.o
local bo = vim.bo

local api = vim.api
local diagnostic = vim.diagnostic
local fn = vim.fn

local highlight = require('gantoreno.utils.highlights')

-- State
local filetype = nil
local ignore_filetypes = {
  ['NvimTree'] = true,
  ['floaterm'] = true,
  ['TelescopePrompt'] = true,
}

local is_prettier_active = false

-- Mappings
local modes = {
  ['n'] = 'Normal',
  ['no'] = 'Normal Operator Pending',
  ['v'] = 'Visual',
  ['V'] = 'Visual Line',
  ['s'] = 'Select',
  ['S'] = 'S Line',
  ['^S'] = 'S Block',
  ['i'] = 'Insert',
  ['R'] = 'Replace',
  ['Rv'] = 'V Replace',
  ['c'] = 'Command',
  ['cv'] = 'Vim Ex',
  ['ce'] = 'Ex',
  ['r'] = 'Prompt',
  ['rm'] = 'More',
  ['r?'] = 'Confirm',
  ['!'] = 'Shell',
  ['t'] = 'Terminal',
}

local endoflines = {
  unix = 'lf',
  windows = 'crlf',
}

-- Custom highlights
api.nvim_set_hl(0, 'SSHConnectionSegment', {
  fg = o.background == 'dark' and '#000000' or '#ffffff',
  bg = o.background == 'dark' and '#ffffff' or '#000000',
})

api.nvim_set_hl(0, 'StatusLineErrorSegment', {
  fg = '#ffffff',
  bg = o.background == 'dark' and '#693a3a' or '#522929',
})

-- Functions
local function build_segment(str, hl)
  return highlight.with_highlight_group(string.format(' %s ', str), hl or 'StatusLine')
end

local function get_ssh()
  return highlight.with_highlight_group('', 'TabLineSel')
    .. build_segment('', 'SSHConnectionSegment')
    .. highlight.with_highlight_group('', 'TabLineSel')
end

local function get_branch()
  local branch_name = fn['gitbranch#name']()

  if branch_name == '' then
    return -1
  end

  return build_segment(string.format(' %s', branch_name))
end

local function get_location()
  return build_segment('Ln %l, Col %c')
end

local function get_mode()
  local current_mode = api.nvim_get_mode().mode
  local current_mode_mapped = modes[current_mode] or 'Visual Block'

  return build_segment(string.format('-- %s --', string.upper(current_mode_mapped)))
end

local function get_indentation()
  return build_segment(string.format('Spaces: %s', o.shiftwidth))
end

local function get_file_encoding()
  return build_segment(bo.fenc:upper())
end

local function get_eol()
  local eol = endoflines[bo.ff]

  if not eol then
    return -1
  end

  return build_segment(eol:upper())
end

local function get_filetype()
  local _filetype = bo.filetype

  if not ignore_filetypes[_filetype] then
    filetype = _filetype
  end

  if filetype == '' then
    return -1
  end

  return build_segment(filetype:gsub('^%l', string.upper))
end

local function get_prettier_status()
  local _is_prettier_active = require('null-ls').is_registered({
    name = 'prettierd',
    filetype = bo.filetype,
  })

  if _is_prettier_active then
    is_prettier_active = _is_prettier_active
  end

  if not is_prettier_active then
    return -1
  end

  local ok_icon = '󰄬'
  local warn_icon = '⚠'

  local has_errors = #diagnostic.get(vim.fn.bufnr(), { severity = diagnostic.severity.ERROR }) > 0

  return build_segment(
    string.format('%s Prettier', has_errors and warn_icon or ok_icon),
    has_errors and 'StatusLineErrorSegment' or nil
  )
end

-- Statusline
function Statusline()
  local s = ''

  --[[ s = s .. get_ssh() .. ' ' ]]

  local left_segments = {
    get_branch(),
    get_mode(),
  }
  local right_segments = {
    get_location(),
    get_indentation(),
    get_file_encoding(),
    get_eol(),
    get_filetype(),
    get_prettier_status(),
  }

  for _, segment in pairs(left_segments) do
    if segment ~= -1 then
      s = s .. ' ' .. segment
    end
  end

  s = s .. '%='

  for i, segment in ipairs(right_segments) do
    if segment ~= -1 then
      s = s .. segment .. ' '
    end
  end

  return s
end

o.statusline = '%{%v:lua.Statusline()%}'
