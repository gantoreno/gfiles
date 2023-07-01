local bo = vim.bo
local g = vim.g
local o = vim.o

local fn = vim.fn
local api = vim.api

-- Helper functions
function get_tab_name(bufname, index)
  local title = fn.gettabvar(index, 'TablineTitle')

  if title ~= vim.NIL and title ~= '' then
    return title
  end

  if bufname == '' then
    return "[No Name]"
  end

  return fn.fnamemodify(bufname, ':t')
end

function get_icon(bufname, extension)
  local ok, web = pcall(require, 'nvim-web-devicons')
  local filename = fn.fnamemodify(bufname, ':t')

  if ok then
    local icon, hl = web.get_icon(filename, extension, { default = true })

    return with_highlight_group(icon, hl)
  end

  return nil
end

function with_highlight_group(text, hl)
  return table.concat { '%#', hl, "#", text, '%##' }
end

-- Tabline
function tabline()
  local last_index = fn.tabpagenr('$')
  local current_index = fn.tabpagenr()

  local t = ''

  for index = 1, last_index do
    local window_number = fn.tabpagewinnr(index)

    local buffer_number = fn.tabpagebuflist(index)[window_number]
    local buffer_name = fn.bufname(buffer_number)
    local buffer_extension = fn.fnamemodify(buffer_name, ':e')

    local is_modified = fn.getbufvar(buffer_number, '&mod') == 1
    local is_active = index == current_index

    local file_name = get_tab_name(buffer_name, index)
    local file_icon = get_icon(buffer_name, buffer_extension) .. ' ' or ''

    local has_errors = #vim.diagnostic.get(buffer_number, { severity = vim.diagnostic.severity.ERROR }) > 0
    local has_warnings = #vim.diagnostic.get(buffer_number, { severity = vim.diagnostic.severity.WARN }) > 0

    t = t .. "%" .. index .. "T"
    t = t ..
        (is_active and '▌  ' or '   ') ..
        file_icon ..
        with_highlight_group(file_name,
          has_errors and 'Error' or has_warnings and 'WarningMsg' or
          is_active and 'StatusLineSel' or 'StatusLine') ..
        (is_modified and ' ⏺ ' or is_active and '%999X  ×' or '   ')
  end

  t = t .. '%='

  return t
end

api.nvim_exec('set tabline=%!v:lua.tabline()', false)
