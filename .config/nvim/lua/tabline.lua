local tabs = require('utils.tabs')
local icons = require('utils.icons')
local highlights = require('utils.highlights')

local fn = vim.fn
local api = vim.api

-- Tabline
function tabline()
  local explorer_label = '  EXPLORER  '

  local last_index = fn.tabpagenr('$')
  local current_index = fn.tabpagenr()

  local is_tree_visible = require('nvim-tree.api').tree.is_visible()

  local t = is_tree_visible and
      highlights.with_highlight_group(explorer_label, 'Directory') .. string.rep(' ', 31 - explorer_label:len()) or ''

  for index = 1, last_index do
    local window_number = fn.tabpagewinnr(index)

    local buffer_number = fn.tabpagebuflist(index)[window_number]
    local buffer_name = fn.bufname(buffer_number)
    local buffer_extension = fn.fnamemodify(buffer_name, ':e')

    local is_modified = fn.getbufvar(buffer_number, '&mod') == 1
    local is_active = index == current_index

    local file_name = tabs.get_tab_name(buffer_name, index)
    local file_icon = icons.get_icon(buffer_name, buffer_extension) .. ' ' or ''

    local has_errors = #vim.diagnostic.get(buffer_number, { severity = vim.diagnostic.severity.ERROR }) > 0
    local has_warnings = #vim.diagnostic.get(buffer_number, { severity = vim.diagnostic.severity.WARN }) > 0

    t = t .. "%" .. index .. "T"
    t = t ..
        (is_active and '▌ ' or '  ') ..
        file_icon ..
        highlights.with_highlight_group(file_name,
          has_errors and 'Error' or has_warnings and 'WarningMsg' or
          is_active and 'StatusLineSel' or 'StatusLine') ..
        (is_modified and highlights.with_highlight_group(' ⏺ ', is_active and 'StatusLineSel' or 'StatusLine') or is_active and '%999X × ' or '   ')
  end

  t = t .. '%='

  return t
end

api.nvim_exec('set tabline=%!v:lua.tabline()', false)
