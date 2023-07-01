local cmd = vim.cmd
local fn = vim.fn

local os_mode = fn.system('defaults read -g AppleInterfaceStyle 2> /dev/null | tr -d "\n"')

-- Mode
cmd.colorscheme(os_mode == 'Dark' and 'gabriel-dark' or 'gabriel-light')
