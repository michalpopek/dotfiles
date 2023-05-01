return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'arkav/lualine-lsp-progress',
  },
  lazy = false,
  opts = {
    options = {
      theme = 'auto',
    },
    extension = { 'quickfix' },
    -- tabline = {
    --   lualine_b = {
    --     {
    --       'tabs',
    --       mode = 2,
    --     },
    --   },
    -- },
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
          'filename',
          path = 1,
        },
      },
      lualine_x = {
        'filetype',
        {
          'lsp_progress',
          display_components = { 'lsp_client_name', 'spinner' },
          spinner_symbols = {
            '🌑 ',
            '🌒 ',
            '🌓 ',
            '🌔 ',
            '🌕 ',
            '🌖 ',
            '🌗 ',
            '🌘 ',
          },
        },
      },
    },
    inactive_sections = {
      lualine_c = {
        {
          'filename',
          path = 1,
        },
      },
    },
  },
}
