local wo = vim.wo
local bo = vim.bo

local fn = vim.fn
local api = vim.api

local navic = require('nvim-navic')
local get_icon_color = require('nvim-web-devicons').get_icon_color

local winbar_ignore_filetypes = {
  NvimTree = true,
}

function Breadcrumbs()
  local location = navic.get_location()

  local current_file = fn.expand('%:t')
  local current_file_extension = fn.fnamemodify(current_file, ':e')

  if current_file == '' then
    current_file = '[No Name]'
  end

  local icon, fg = get_icon_color(current_file, current_file_extension, { default = true })
  local bg = fn.synIDattr(fn.synIDtrans(fn.hlID('Winbar')), 'bg')

  api.nvim_set_hl(0, 'BreadcrumbsIconColor', { fg = fg, bg = bg })

  return ' %#BreadcrumbsIconColor#'
    .. icon
    .. ' %#Winbar#'
    .. current_file
    .. (location == '' and '' or ' › ' .. location)
end

api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  callback = function()
    local filetype = bo.filetype

    local window_config = api.nvim_win_get_config(0).relative
    local window_name = api.nvim_buf_get_name(0)
    local window_option = api.nvim_buf_get_option(0, 'buftype')

    if
      winbar_ignore_filetypes[filetype]
      or filetype == ''
      or window_config ~= ''
      or window_name == ''
      or window_option ~= ''
    then
      return
    end

    wo.winbar = '%{%v:lua.Breadcrumbs()%}'
  end,
})
