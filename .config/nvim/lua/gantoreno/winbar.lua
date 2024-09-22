local bo = vim.bo
local wo = vim.wo

local api = vim.api
local fn = vim.fn

local navic = require('nvim-navic')
local get_icon = require('nvim-web-devicons').get_icon

local winbar_ignore_filetypes = {
  NvimTree = true,
}

local winbar_special_filetypes = {
  floaterm = true,
}

function Winbar()
  local w = ' '

  local current_file = fn.expand('%:t')
  local current_file_extension = fn.fnamemodify(current_file, ':e')

  if current_file == '' then
    current_file = '[No Name]'
  end

  local icon, highlight = get_icon(current_file, current_file_extension, { default = true })

  w = w .. '%#' .. highlight .. '#' .. icon .. '%#Winbar# ' .. current_file

  local is_location_available = navic.is_available()

  if is_location_available then
    local location = navic.get_location()

    w = w .. ' > ' .. (location ~= '' and location or '…')
  else
    w = w .. ' > ' .. '…'
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

    wo.winbar = '%{%v:lua.Winbar()%}'
  end,
})
