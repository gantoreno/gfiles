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
        section_separators = { left = '', right = '' },
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
              local bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID('UltraVisual')), 'bg')
              local fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID('lualine_b_normal')), 'bg')

              vim.api.nvim_set_hl(0, 'lualine_a_2_angle', { fg = fg, bg = bg })

              return '%#lualine_a_2_angle#'
            end,
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
              local root = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')

              local fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID('lualine_a_replace')), 'bg')
              local bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID('lualine_c_normal')), 'bg')

              vim.api.nvim_set_hl(0, 'lualine_y_icon', { fg = fg, bg = bg })

              return '%#lualine_y_icon#%#lualine_a_replace#'
                .. icons.directory
                .. '%#lualine_b_normal# '
                .. root
                .. ' '
            end,
            padding = 0,
          },
        },
        lualine_z = {
          {
            function()
              local fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID('lualine_a_insert')), 'bg')
              local bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID('lualine_b_normal')), 'bg')

              vim.api.nvim_set_hl(0, 'lualine_z_icon', { fg = fg, bg = bg })

              return '%#lualine_z_icon#%#lualine_a_insert#' .. icons.lines .. '%#lualine_b_normal#' .. ' %p%% '
            end,
            padding = 0,
          },
        },
      },
    },
  },
}
