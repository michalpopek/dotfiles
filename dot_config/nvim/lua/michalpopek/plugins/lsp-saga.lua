return {
  'glepnir/lspsaga.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-treesitter/nvim-treesitter',
  },
  event = 'LspAttach',
  config = function()
    require('lspsaga').setup({
      symbol_in_winbar = {
        enable = false,
      },
      lightbulb = {
        enable = false,
      },
    })

    vim.keymap.set(
      'n',
      'K',
      '<cmd>Lspsaga hover_doc<CR>',
      { desc = 'Show documentation in a hover window' }
    )

    vim.keymap.set(
      'n',
      ']d',
      '<cmd>Lspsaga diagnostic_jump_next<cr>',
      { desc = 'jump to next diagnostic' }
    )

    vim.keymap.set(
      'n',
      ']d',
      '<cmd>Lspsaga diagnostic_jump_prev<cr>',
      { desc = 'jump to previous diagnostic' }
    )

    vim.keymap.set(
      'n',
      'gd',
      '<cmd>Lspsaga goto_definition<CR>',
      { desc = 'Jump to definition' }
    )

    vim.keymap.set(
      'n',
      'go',
      '<cmd>Lspsaga goto_type_definition<CR>',
      { desc = 'Go to type definition' }
    )

    vim.keymap.set(
      'n',
      'gO',
      '<cmd>Lspsaga peek_type_definition<CR>',
      { desc = 'Peek type definition' }
    )

    vim.keymap.set(
      'n',
      'gr',
      '<cmd>Lspsaga lsp_finder<CR>',
      { desc = 'Display LSP finder with references' }
    )

    vim.keymap.set(
      'n',
      'gl',
      '<cmd>Lspsaga show_line_diagnostics<CR>',
      { desc = 'Show line diagnostics' }
    )

    vim.keymap.set(
      'n',
      '<leader>la',
      'cmd>Lspsaga code_action<CR>',
      { desc = 'Show code actions' }
    )

    vim.keymap.set(
      'n',
      '<leader>lr',
      '<cmd>Lspsaga rename<CR>',
      { desc = 'Rename symbol' }
    )

    vim.keymap.set(
      'n',
      '<leader>lo',
      '<cmd>Lspsaga outline<CR>',
      { desc = 'Show outline' }
    )

    vim.keymap.set(
      'n',
      '<leader>ld',
      '<cmd>Lspsaga show_buf_diagnostics<CR>',
      { desc = 'Show buffer diagnostics' }
    )

    vim.keymap.set(
      'n',
      '<leader>lD',
      '<cmd>Lspsaga show_workspace_diagnostics<CR>',
      { desc = 'Show workspace diagnostics' }
    )
  end,
}
