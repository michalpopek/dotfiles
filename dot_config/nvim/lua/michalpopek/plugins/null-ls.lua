return {
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
  },
  {
    'jay-babu/mason-null-ls.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'jose-elias-alvarez/null-ls.nvim',
    },
    config = function()
      local mason_null_ls = require 'mason-null-ls'

      mason_null_ls.setup {
        ensure_installed = { 'stylua', 'prettierd' },
        automatic_setup = { true },
      }

      mason_null_ls.setup_handlers {}
    end,
  },
}
