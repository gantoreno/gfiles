local bo = vim.bo

local api = vim.api
local fn = vim.fn

local icons = require('gantoreno.utils.icons')

local winbar_ignore_filetypes = {
  NvimTree = true,
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

    if parent_directory ~= '/' then
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
    end
  end

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
