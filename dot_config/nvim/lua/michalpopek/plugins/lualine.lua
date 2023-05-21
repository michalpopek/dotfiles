-- TODO: implement feline.nvim + tabby.nvim
-- return {
--   {
--     'freddiehaddad/feline.nvim',
--     opts = {
--       separators = {
--         left_sep = 'left_rounded',
--         right_sep = 'right_rounded',
--       },
--     },
--   },
-- }

return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'arkav/lualine-lsp-progress',
  },
  lazy = false,
  opts = {
    options = {
      theme = 'auto',
      disabled_filetypes = {
        statusline = { 'NvimTree' },
      },
    },
    extension = { 'quickfix' },
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
        'filetype',
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
