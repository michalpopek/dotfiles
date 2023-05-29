return {
  'jay-babu/mason-null-ls.nvim',
  dependencies = {
    'williamboman/mason.nvim',
    'jose-elias-alvarez/null-ls.nvim',
  },
  cmd = 'LspInfo',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('mason-null-ls').setup({
      ensure_installed = { 'stylua', 'prettierd', 'shfmt' },
      automatic_setup = true,
      handlers = {},
    })

    require('null-ls').setup()
  end,
}
