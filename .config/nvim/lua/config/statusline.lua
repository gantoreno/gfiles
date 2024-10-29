local modes = {
  ['n'] = { 'NORMAL', 'StatuslineModeNormal' },
  ['no'] = { 'NORMAL', 'StatuslineModeNormal' },
  ['v'] = { 'VISUAL', 'StatuslineModeNormal' },
  ['V'] = { 'VISUAL LINE', 'StatuslineModeNormal' },
  [''] = { 'VISUAL BLOCK', 'StatuslineModeNormal' },
  ['s'] = { 'SELECT', 'StatuslineModeNormal' },
  ['S'] = { 'SELECT LINE', 'StatuslineModeNormal' },
  [''] = { 'SELECT BLOCK', 'StatuslineModeNormal' },
  ['i'] = { 'INSERT', 'StatuslineModeNormal' },
  ['ic'] = { 'INSERT', 'StatuslineModeNormal' },
  ['R'] = { 'REPLACE', 'StatuslineModeNormal' },
  ['Rv'] = { 'VISUAL REPLACE', 'StatuslineModeNormal' },
  ['c'] = { 'COMMAND', 'StatuslineModeNormal' },
  ['cv'] = { 'VIM EX', 'StatuslineModeNormal' },
  ['ce'] = { 'EX', 'StatuslineModeNormal' },
  ['r'] = { 'PROMPT', 'StatuslineModeNormal' },
  ['rm'] = { 'MOAR', 'StatuslineModeNormal' },
  ['r?'] = { 'CONFIRM', 'StatuslineModeNormal' },
  ['!'] = { 'SHELL', 'StatuslineModeNormal' },
  ['t'] = { 'TERMINAL', 'StatuslineModeNormal' },
}

function Statusline()
  local mode = modes[vim.api.nvim_get_mode().mode]
  return ' ' .. mode[1] .. ' ' .. mode[2]
end

vim.o.statusline = '%{%v:lua.Statusline()%}'
