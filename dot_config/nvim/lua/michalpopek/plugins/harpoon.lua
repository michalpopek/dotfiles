return {
  'ThePrimeagen/harpoon',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('harpoon').setup()

    local ui = require('harpoon.ui')

    vim.keymap.set('n', ']h', function()
      ui.nav_next()
    end, { desc = 'Navigate to next [h]arpooned file' })

    vim.keymap.set('n', '[h', function()
      ui.nav_prev()
    end, { desc = 'Navigate to previous [h]arpooned file' })

    vim.keymap.set('n', '<leader>hl', function()
      ui.toggle_quick_menu()
    end, { desc = 'Manage [h]arpooned fi[l]es' })

    vim.keymap.set('n', '<leader>ha', function()
      require('harpoon.mark').add_file()
    end, { desc = '[ha]rpoon current file' })
  end,
}
