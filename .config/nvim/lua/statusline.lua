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

local mode_colors = {
  ['Normal'] = 'UIBlockBlue',
  ['Replace'] = 'UIBlockRed',
  ['Insert'] = 'UIBlockGreen',
  ['Visual'] = 'UIBlockCyan',
  ['Visual Line'] = 'UIBlockCyan',
  ['Visual Block'] = 'UIBlockMagenta',
  ['Command'] = 'UIBlockMagenta',
  ['Terminal'] = 'UIBlockRed',
  ['Shell'] = 'UIBlockGreen',
  ['default'] = 'UIBlockBlue',
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

-- Functions
local function branch()
  local branch = fn.system('git branch --show-current 2> /dev/null | tr -d "\n"')

  if branch == '' then
    branch = 'No branch'
  end

  return ' ' .. string.format(' %s', branch) .. ' '
end

local function mode()
  local current_mode = api.nvim_get_mode().mode
  local current_mode_mapped = modes[current_mode]

  if current_mode_mapped == nil then
    current_mode_mapped = 'Visual Block' -- TODO: Fix this behavior
  end

  return ' ' .. current_mode_mapped .. ' '
end

local function metadata()
  local spaces = o.shiftwidth
  local encoding = bo.fenc
  local endofline = endoflines[vim.bo.ff]

  return table.concat {
    ' ',
    string.format("Spaces: %s", spaces),
    ' | ',
    string.format("%s", encoding):upper(),
    ' | ',
    string.format("%s", endofline):upper(),
    ' ',
  }
end

local function filetype()
  local filetype = bo.filetype

  if filetype == '' then
    filetype = 'Unknown'
  end

  return ' ' .. string.format(" %s", filetype) .. ' '
end

fn.with_highlight_group = function(text, hl)
  return '%#' .. hl .. "#" .. text .. '%##'
end

function all_trim(s)
   return s:match( "^%s*(.-)%s*$" )
end

function get_mode_highlight(mode)
  local mode = all_trim(mode)
  local highlight = mode_colors[mode]

  if highlight == nil then
    return mode_colors['default']
  end

  return highlight
end

-- Statusline
function statusline()
  local mode = mode()
  local branch = branch()
  local metadata = metadata()
  local filetype = filetype()
  return table.concat {
    fn.with_highlight_group(string.upper(mode), get_mode_highlight(mode)),
    fn.with_highlight_group(branch, 'UIBlockMuted'),
    separator,
    fn.with_highlight_group(metadata, 'UIBlockMuted'),
    fn.with_highlight_group(filetype, 'UIBlockBlue'),
  }
end

api.nvim_exec('set statusline=%!v:lua.statusline()', false)
