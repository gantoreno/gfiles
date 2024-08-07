local prettier = require('formatter.defaults.prettier')

local stylua = { exe = 'stylua', args = { '--indent-width', '2', '-' }, stdin = true }

require('formatter').setup({
  logging = true,
  filetype = {
    javascript = { prettier },
    typescript = { prettier },
    javascriptreact = { prettier },
    typescriptreact = { prettier },
    lua = { stylua },
  },
})
