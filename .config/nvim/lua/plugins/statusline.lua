local icons = {
  vim = '',
  github = '',
  git_added = ' ',
  git_changed = ' ',
  git_removed = ' ',
  lsp = ' ',
  lsp_error = ' ',
  lsp_warn = ' ',
  lsp_info = '󰋼 ',
  lsp_hint = '󰛩 ',
  directory = '󰉋 ',
  lines = ' ',
}

return {
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    opts = {
      options = {
        theme = 'earthbound',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          {
            'mode',
            icon = icons.vim,
          },
        },
        lualine_b = {
          {
            function()
              return ' '
            end,
            color = 'UltraVisual',
            padding = 0,
          },
          {
            function()
              local filename = vim.fn.expand('%:t')
              local filetype = vim.fn.expand('%:e')
              local icon = require('nvim-web-devicons').get_icon(filename, filetype)

              return (#filename > 0 and icon or '󰈚') .. ' ' .. (string.len(filename) > 0 and filename or 'Empty')
            end,
          },
        },
        lualine_c = {
          {
            'b:gitsigns_head',
            icon = icons.github,
          },
          {
            'diff',
            colored = false,
            symbols = {
              added = icons.git_added,
              modified = icons.git_changed,
              removed = icons.git_removed,
            },
          },
        },
        lualine_x = {
          {
            'diagnostics',
            symbols = {
              error = icons.lsp_error,
              warn = icons.lsp_warn,
              info = icons.lsp_info,
              hint = icons.lsp_hint,
            },
          },
          {
            function()
              local clients = vim.lsp.get_clients()

              if #clients < 1 then
                return ''
              end

              return clients[1].name
            end,
            icon = icons.lsp .. ' LSP ~ ',
            color = 'lualine_x_diagnostics_info_visual',
          },
        },
        lualine_y = {
          {
            function()
              return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
            end,
            icon = {
              icons.directory,
              color = 'lualine_a_replace',
            },
          },
        },
        lualine_z = {
          {
            function()
              return '%p %%'
            end,
            color = 'lualine_b_normal',
            icon = {
              icons.lines,
              color = 'lualine_a_insert',
            },
          },
        },
      },
    },
  },
}
