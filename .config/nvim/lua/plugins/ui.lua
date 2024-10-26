return {
  -- Icons
  { 'nvim-tree/nvim-web-devicons', opts = { default = true } },

  -- Tabline & statusline
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
    },
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local bufferline = require('bufferline')

      bufferline.setup({
        options = {
          mode = 'tabs',
          style_preset = {
            bufferline.style_preset.no_bold,
            bufferline.style_preset.no_italic,
          },
          offsets = {
            {
              filetype = 'NvimTree',
              text = function()
                return vim.fn.fnamemodify(vim.loop.cwd(), ':~:s?$?/..?')
              end,
              text_align = 'left',
              separator = true,
              highlight = 'BufferLineOffset',
            },
          },
        },
        highlights = {
          fill = {
            link = 'NvimTreeNormal',
          },
          offset_separator = {
            link = 'NvimTreeWinSeparator',
          },
        },
      })
    end,
  },

  -- Nice UI
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  {
    'folke/noice.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    opts = {
      presets = {
        command_palette = true,
        lsp_doc_border = true,
      },
      lsp = {
        hover = {
          opts = {
            border = {
              padding = { 0, 0 },
            },
          },
        },
      },
      routes = {
        {
          filter = {
            event = 'notify',
            find = 'No information available',
          },
          opts = {
            skip = true,
          },
        },
      },
    },
  },

  -- Nice rendering
  { 'norcalli/nvim-colorizer.lua' },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  },

  -- Git UI
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '┃' },
        change = { text = '┃' },
        delete = { text = '▸' },
        topdelete = { text = '▸' },
        changedelete = { text = '▸' },
        untracked = { text = '┃' },
      },
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        delay = 500,
        ignore_whitespace = false,
      },
    },
  },

  -- Versatile terminals
  {
    'voldikss/vim-floaterm',
    config = function()
      vim.g.floaterm_borderchars = '─│─│╭╮╯╰'
      vim.g.floaterm_shell = 'NEOVIM=1 /usr/bin/env zsh'
      vim.g.floaterm_height = 0.25
      vim.g.floaterm_autoclose = 2
      vim.g.floaterm_wintype = 'split'
      vim.g.floaterm_position = 'botright'
      vim.g.floaterm_title = ' Floaterm '
      vim.g.floaterm_titleposition = 'center'
    end,
  },

  -- File browsing
  {
    'nvim-tree/nvim-tree.lua',
    config = function()
      require('nvim-tree').setup({
        actions = {
          open_file = {
            quit_on_open = true,
          },
          file_popup = {
            open_win_config = {
              border = 'rounded',
            },
          },
        },
        renderer = {
          group_empty = false,
          highlight_git = true,
          special_files = {},
          root_folder_label = false,
          icons = {
            glyphs = {
              folder = {
                arrow_closed = '󰅂',
                arrow_open = '󰅀',
                default = '',
                open = '',
                empty = '',
                empty_open = '',
                symlink = '',
                symlink_open = '',
              },
            },
          },
        },
        update_focused_file = {
          enable = true,
        },
        tab = {
          sync = {
            open = true,
            close = true,
            ignore = {},
          },
        },
        view = {
          signcolumn = 'yes',
          width = {
            min = '33%',
            max = 40,
          },
        },
        filters = {
          dotfiles = false,
          git_ignored = false,
          custom = {
            '.DS_Store',
          },
        },
      })
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require('telescope').setup({
        pickers = {
          find_files = { hidden = true },
          live_grep = { hidden = true },
        },
        defaults = {
          prompt_prefix = ' ',
          selection_caret = ' ',
          entry_prefix = ' ',
          preview = true,
          mappings = {
            i = {
              ['<esc>'] = require('telescope.actions').close,
            },
          },
          file_ignore_patterns = {
            'node_modules',
            '.git',
            'build',
            'static',
            '.oh%-my%-zsh',
            '.tmux/',
          },
        },
      })
    end,
  },
}
