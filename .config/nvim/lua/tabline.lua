local bo = vim.bo
local g = vim.g
local o = vim.o

local fn = vim.fn
local api = vim.api

-- Functions
fn.get_tabname = function(bufname, index)
    local title = vim.fn.gettabvar(index, 'TablineTitle')
    if title ~= vim.NIL and title ~= '' then
        return title
    end
    if bufname == '' then
        return "[No Name]"
    end
    return vim.fn.fnamemodify(bufname, ':t')
end

fn.with_highlight_group = function(text, hl)
  return '%#' .. hl .. "#" .. text .. '%##'
end

fn.get_icon = function(bufname, extension)
  local ok, web = pcall(require, 'nvim-web-devicons')
  local filename = fn.fnamemodify(bufname, ':t')
  
  if ok then
    local icon, icon_hl = web.get_icon(filename, extension, { default = true })

    return icon
  end

  return nil
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

    local file_name = fn.get_tabname(buffer_name, index)
    local file_extension = fn.fnamemodify(buffer_name, ':e')

    local icon = fn.get_icon(buffer_name, file_extension) .. ' ' or ''

    local is_modified = fn.getbufvar(buffer_number, '&mod') == 1
    local is_active = index == current_index

    t = t .. "%" .. index .. "T" 
    t = t .. fn.with_highlight_group(' ' .. icon .. file_name .. (is_modified and ' ⏺ ' or ' '), is_active and 'UIBlockInverse' or 'UIBlockMuted')
  end

  t = t .. '%='
  t = t .. fn.with_highlight_group(' X ', 'UIBlockMuted')

  return t
end

api.nvim_exec('set tabline=%!v:lua.tabline()', false)

