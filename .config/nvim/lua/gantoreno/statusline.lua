local o = vim.o
local bo = vim.bo

local fn = vim.fn
local api = vim.api

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

local paddings = {
  small = '  ',
  large = '   ',
}

local separator = '%='

-- Functions
local function branch()
  local branch_name = fn['gitbranch#name']()

  if branch_name == '' then
    branch_name = 'No branch'
  end

  return string.format('󰘬 %s', branch_name)
end

local function mode()
  local current_mode = api.nvim_get_mode().mode
  local current_mode_mapped = modes[current_mode] or 'Visual Block'

  return string.format('-- %s --', string.upper(current_mode_mapped))
end

local function metadata()
  local spaces = o.shiftwidth
  local encoding = bo.fenc
  local endofline = endoflines[bo.ff]
  local filetype = bo.filetype

  if filetype == '' then
    filetype = 'Unknown'
  end

  local row, column = unpack(api.nvim_win_get_cursor(0))

  return table.concat {
    string.format("Ln %s, Col %s", row, column),
    paddings.large,
    string.format("spaces: %s", spaces),
    paddings.large,
    string.format("%s", encoding):upper(),
    paddings.large,
    string.format("%s", endofline):upper(),
    paddings.large,
    string.format(" %s", filetype),
  }
end

-- Statusline
function Statusline()
  return
      paddings.small ..
      branch() ..
      paddings.large ..
      mode() ..
      separator ..
      metadata() ..
      paddings.small
end

o.statusline = '%{%v:lua.Statusline()%}'
