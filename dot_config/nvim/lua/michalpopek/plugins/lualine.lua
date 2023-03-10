return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'arkav/lualine-lsp-progress',
  },
  opts = {
    options = {
      theme = 'auto',
    },
    winbar = {
      lualine_c = {
        {
          'filename',
          path = 1,
        },
      },
    },
    inactive_winbar = {
      lualine_c = {
        {
          'filename',
          path = 1,
        },
      },
    },
    sections = {
      lualine_b = {
        {
          'branch',
          icon = ' ',
        },
        {
          'diff',
          symbols = {
            added = ' ',
            modified = ' ',
            removed = ' ',
          },
        },
        {
          'diagnostics',
          symbols = {
            error = ' ',
            warn = ' ',
            info = ' ',
            hint = ' ',
          },
        },
      },
      lualine_c = {
        {
          'lsp_progress',
          display_components = { 'lsp_client_name', 'spinner' },
          spinner_symbols = { '🌑 ', '🌒 ', '🌓 ', '🌔 ', '🌕 ', '🌖 ', '🌗 ', '🌘 ' },
        },
      },
      lualine_x = {
        'filetype',
      },
    },
    inactive_sections = {
      lualine_c = {},
    },
  },
}
