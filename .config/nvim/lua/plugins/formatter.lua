return {
  {
    'mhartington/formatter.nvim',
    config = function()
      local prettier = require('formatter.defaults.prettier')
      local mixformat = require('formatter.defaults.mixformat')
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
          javascript = { prettier },
          typescript = { prettier },
          javascriptreact = { prettier },
          typescriptreact = { prettier },
          elixir = { mixformat },
          go = { goimports },
          lua = { stylua },
          rust = { rustfmt },
          zig = { zigfmt },
        },
      })
    end,
  },
}
