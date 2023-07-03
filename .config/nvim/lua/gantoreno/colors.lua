local cmd = vim.cmd
local fn = vim.fn

local os_mode = fn.system('defaults read -g AppleInterfaceStyle 2> /dev/null | tr -d "\n"')

vim.o.background = os_mode == 'Dark' and 'dark' or 'light'

-- Mode
cmd.colorscheme('gabriel')
