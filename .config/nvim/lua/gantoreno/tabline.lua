local diagnostic = vim.diagnostic
local fn = vim.fn

local tabs = require('gantoreno.utils.tabs')
local icons = require('gantoreno.utils.icons')
local highlights = require('gantoreno.utils.highlights')

-- State
local windows = {}
local ignore_filetypes = {
  ['NvimTree'] = true,
  ['floaterm'] = true,
  ['TelescopePrompt'] = true,
}

-- Tabline
function Tabline()
  local t = ''

  local last_index = fn.tabpagenr('$')
  local current_index = fn.tabpagenr()

  local is_tree_visible = require('nvim-tree.api').tree.is_visible()

  if is_tree_visible then
    local explorer_label = '  EXPLORER  '

    t = t
      .. highlights.with_highlight_group(explorer_label, 'Directory')
      .. string.rep(' ', vim.fn.winwidth(1) + 1 - explorer_label:len())
  end

  for index = 1, last_index do
    local window_number = fn.tabpagewinnr(index)

    local _buffer_number = fn.tabpagebuflist(index)[window_number]

    if not ignore_filetypes[fn.getbufvar(_buffer_number, '&filetype')] then
      windows[index] = _buffer_number
    end

    local buffer_number = windows[index]

    local buffer_name = fn.bufname(buffer_number)
    local buffer_extension = fn.fnamemodify(buffer_name, ':e')

    local is_modified = fn.getbufvar(buffer_number, '&mod') == 1
    local is_active = index == current_index

    local file_name = tabs.get_tab_name(buffer_name, index)
    local file_icon = icons.get_icon(buffer_name, buffer_extension) .. ' '

    local has_errors = #diagnostic.get(buffer_number, { severity = diagnostic.severity.ERROR }) > 0
    local has_warnings = #diagnostic.get(buffer_number, { severity = diagnostic.severity.WARN }) > 0

    t = t .. '%' .. index .. 'T'
    t = t .. (is_active and '▌ ' or '  ')
    t = t
      .. file_icon
      .. highlights.with_highlight_group(
        file_name,
        has_errors and 'Error' or has_warnings and 'WarningMsg' or is_active and 'StatusLineSel' or 'StatusLine'
      )
    t = t
      .. (
        is_modified and highlights.with_highlight_group(' ⏺ ', is_active and 'StatusLineSel' or 'StatusLine')
        or is_active and '%999X 󰅖 '
        or '   '
      )
  end

  t = t .. '%='

  t = t .. '  ' .. highlights.with_highlight_group('', 'Normal')
  t = t .. '  ' .. highlights.with_highlight_group('󰇘', 'Normal')

  t = t .. '  '

  return t
end

vim.o.tabline = '%{%v:lua.Tabline()%}'
