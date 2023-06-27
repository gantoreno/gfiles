local g = vim.g
local o = vim.o
local bo = vim.bo

local api = vim.api
local fn = vim.fn

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
  small = ' ',
  large = '   ',
}

local separator = '%='

-- Helper functions
function all_trim(s)
  return s:match("^%s*(.-)%s*$")
end

function get_mode_highlight(mode)
  local mode = all_trim(mode)
  local highlight = mode_colors[mode]

  if highlight == nil then
    return mode_colors['default']
  end

  return highlight
end

function with_highlight_group(text, hl)
  return table.concat { '%#', hl, "#", text, '%##' }
end

-- Segments
local function branch()
  local branch = fn.system('git branch --show-current 2> /dev/null | tr -d "\n"')

  if branch == '' then
    branch = 'No branch'
  end

  return table.concat { ' ', string.format(' %s', branch), ' ' }
end

local function mode()
  local current_mode = api.nvim_get_mode().mode
  local current_mode_mapped = modes[current_mode]

  if current_mode_mapped == nil then
    current_mode_mapped = 'Visual Block' -- TODO: Fix this behavior
  end

  return table.concat { ' ', current_mode_mapped:upper(), ' ' }
end

local function metadata()
  local spaces = o.shiftwidth
  local encoding = bo.fenc
  local endofline = endoflines[vim.bo.ff]

  return table.concat { ' Spaces: ', spaces, ' | ', encoding:upper(), ' | ', endofline:upper(), ' ' }
end

local function filetype()
  local filetype = bo.filetype

  if filetype == '' then
    filetype = 'Unknown'
  end

  return table.concat { ' ', string.format(" %s", filetype), ' ' }
end

function lsp()
  local error_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warning_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })

  return table.concat {
    with_highlight_group('  ', 'ErrorStrong'),
    error_count,
    with_highlight_group('  ', 'WarningStrong'),
    warning_count
  }
end

-- Statusline
function statusline()
  return table.concat {
    with_highlight_group(mode(), 'UIBlockInverse'),
    with_highlight_group(branch(), 'UIBlockMuted'),
    with_highlight_group(lsp(), 'UIBlockMuted'),
    separator,
    with_highlight_group(metadata(), 'UIBlockMuted'),
    with_highlight_group(filetype(), 'UIBlockInverse'),
  }
end

api.nvim_exec('set statusline=%!v:lua.statusline()', false)
