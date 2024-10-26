return {
  -- Change surrounding characters
  { 'tpope/vim-surround' },

  -- Organize keybindings
  {
    'folke/which-key.nvim',
    opts = {
      win = {
        width = 0.999,
        height = { min = 4, max = 25 },
        col = 0.5,
        row = -1,
        border = 'rounded',
        title = true,
        title_pos = 'center',
      },
    },
  },

  -- Automatic tags & pairs
  {
    'windwp/nvim-autopairs',
    opts = {
      check_ts = true,
    },
  },
  {
    'windwp/nvim-ts-autotag',
    opts = {
      filetypes = {
        'astro',
        'html',
        'javascript',
        'typescript',
        'javascriptreact',
        'typescriptreact',
        'svelte',
        'vue',
        'tsx',
        'jsx',
        'rescript',
      },
    },
  },

  -- Code comment
  {
    'terrortylor/nvim-comment',
    config = function()
      require('nvim_comment').setup({
        comment_empty = false,
      })
    end,
  },

  -- Formatting
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

  -- Indentation
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('ibl').setup({
        indent = { char = '│' },
        scope = {
          show_start = false,
          show_end = false,
        },
      })
    end,
  },

  -- Easier navigation
  { 'christoomey/vim-tmux-navigator' },
}
