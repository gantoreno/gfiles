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
  large = '  ',
}

local separator = '%='

-- Functions
local function branch()
  local branch = vim.fn.system('git branch --show-current 2> /dev/null | tr -d "\n"')

  if branch == '' then
    branch = 'No branch'
  end

  return string.format('󰘬 %s', branch)
end

local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  local current_mode_mapped = modes[current_mode]

  if current_mode_mapped == nil then
    current_mode_mapped = 'Visual Block' -- TODO: Fix this behavior
  end

  return string.format('-- %s --', string.upper(current_mode_mapped))
end

local function metadata()
  local spaces = vim.o.shiftwidth
  local encoding = vim.bo.fenc
  local endofline = endoflines[vim.bo.ff]
  local filetype = vim.bo.filetype

  if filetype == '' then
    filetype = 'Unknown'
  end

  local row, column = unpack(vim.api.nvim_win_get_cursor(0))

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
function statusline()
  return table.concat {
    paddings.small,
    branch(),
    paddings.large,
    mode(),
    separator,
    metadata(),
    paddings.small
  }
end

vim.api.nvim_exec('set statusline=%!v:lua.statusline()', false)
