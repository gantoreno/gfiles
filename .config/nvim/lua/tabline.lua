local bo = vim.bo
local g = vim.g
local o = vim.o

local fn = vim.fn
local api = vim.api

-- Functions
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
    local icon = web.get_icon(filename, extension, { default = true })

    return icon
  end

  return nil
end

function with_highlight_group(text, hl)
  return table.concat {
    '%#', hl, "#", text, '%##'
  }
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

    t = t .. "%" .. index .. "T" 
    t = t .. with_highlight_group(' ' .. file_icon .. file_name .. (is_modified and ' ⏺ ' or ' '), is_active and 'UIBlockInverse' or 'UIBlockMuted')
  end

  t = t .. '%='
  t = t .. with_highlight_group('%999X X ', 'UIBlockMuted')

  return t
end

api.nvim_exec('set tabline=%!v:lua.tabline()', false)

