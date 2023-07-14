local bo = vim.bo

local api = vim.api
local fn = vim.fn

local icons = require('gantoreno.utils.icons')
local highlights = require('gantoreno.utils.highlights')

local winbar_ignore_filetypes = {
  NvimTree = true,
}

local winbar_special_filetypes = {
  floaterm = true,
}

function Winbar()
  local w = '  '

  local root_directory = vim.loop.cwd()

  local base_directory = fn.expand('%:h')
  local parent_directory = string.match(base_directory, '/(%w+)$')

  local current_file = fn.expand('%:t')
  local current_file_extension = fn.fnamemodify(current_file, ':e')

  if not parent_directory then
    parent_directory = fn.expand('%:p')
    parent_directory = parent_directory:gsub(current_file, '')

    if parent_directory and parent_directory ~= '/' then
      parent_directory = parent_directory:sub(2, -2)
      parent_directory = parent_directory:gsub('/', '  ')
    end
  end

  if parent_directory and base_directory ~= '.' and base_directory ~= root_directory then
    w = w .. '%#Directory#' .. parent_directory .. '  '
  end

  if current_file == '' then
    current_file = '[No Name]'
  end

  local icon = icons.get_icon(current_file, current_file_extension)

  w = w .. icon .. '%#Directory# ' .. current_file

  local is_location_available = require('nvim-navic').is_available()

  if is_location_available then
    local location = require('nvim-navic').get_location()

    if location ~= '' then
      w = w .. '  ' .. location
    else
      w = w .. '  ' .. '…'
    end
  end

  return w
end

function SpecialWinbar()
  local w = ''

  w = w .. highlights.with_highlight_group('▎ TERMINAL', 'TabLineSel') .. '   '
  w = w .. highlights.with_highlight_group('DEBUG CONSOLE', 'Directory') .. '   '
  w = w .. highlights.with_highlight_group('PROBLEMS', 'Directory') .. '   '
  w = w .. highlights.with_highlight_group('COMMENTS', 'Directory') .. '   '

  w = w .. '%='

  w = w .. highlights.with_highlight_group(' zsh', 'Directory') .. '  '
  w = w .. highlights.with_highlight_group('', 'Directory') .. '  '
  w = w .. highlights.with_highlight_group('', 'Directory') .. '  '
  w = w .. highlights.with_highlight_group('󰩺', 'Directory') .. '  '
  w = w .. highlights.with_highlight_group('󰇘', 'Directory') .. '  '
  w = w .. highlights.with_highlight_group('', 'Directory') .. '  '
  w = w .. highlights.with_highlight_group('', 'Directory') .. '  '

  return w
end

api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  callback = function()
    local filetype = bo.filetype

    if winbar_ignore_filetypes[filetype] or filetype == '' then
      return
    end

    vim.wo.winbar = '%{%v:lua.Winbar()%}'
  end,
})

api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    local filetype = bo.filetype

    local window_settings = vim.api.nvim_win_get_config(0)

    if winbar_special_filetypes[filetype] and window_settings.relative == '' then
      vim.wo.winbar = '%{%v:lua.SpecialWinbar()%}'
    end
  end,
})
