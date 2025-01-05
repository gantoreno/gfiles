return {
  {
    'mhartington/formatter.nvim',
    config = function()
      local mixformat = require('formatter.defaults.mixformat')
      local phpcfb = require('formatter.defaults.phpcbf')
      local prettier = require('formatter.defaults.prettier')
      local zigfmt = require('formatter.defaults.zigfmt')

      local stylua = function()
        return {
          exe = 'stylua',
          args = { '--indent-width', '2', '-' },
          stdin = true,
        }
      end

      local goimports = function()
        return {
          exe = 'goimports',
          stdin = true,
        }
      end

      local rustfmt = function()
        return {
          exe = 'rustfmt',
          stdin = true,
        }
      end

      require('formatter').setup({
        logging = true,
        filetype = {
          json = { prettier },
          jsonc = { prettier },
          javascript = { prettier },
          typescript = { prettier },
          javascriptreact = { prettier },
          typescriptreact = { prettier },
          elixir = { mixformat },
          go = { goimports },
          lua = { stylua },
          php = { phpcfb },
          rust = { rustfmt },
          zig = { zigfmt },
        },
      })
    end,
  },
}
