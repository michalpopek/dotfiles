return {
  'jay-babu/mason-null-ls.nvim',
  dependencies = {
    'williamboman/mason.nvim',
    'jose-elias-alvarez/null-ls.nvim',
  },
  event = 'VeryLazy',
  config = function()
    require('mason-null-ls').setup({
      ensure_installed = { 'stylua', 'prettierd', 'shfmt' },
      automatic_setup = true,
      handlers = {},
    })

    require('null-ls').setup()
  end,
}
