local command = vim.api.nvim_command

local api = vim.api
local fn = vim.fn

local os_mode = fn.system('defaults read -g AppleInterfaceStyle 2> /dev/null | tr -d "\n"')

-- Mode
if os_mode == 'Dark' then
  command('colorscheme gabriel-dark')
else
  command('colorscheme gabriel-light')
end

