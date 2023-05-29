return {
  'ThePrimeagen/harpoon',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('harpoon').setup()

    local ui = require('harpoon.ui')

    vim.keymap.set(
      'n',
      ']f',
      ui.nav_next,
      { desc = 'Harpoon: navigate to next [f]ile' }
    )

    vim.keymap.set(
      'n',
      '[f',
      ui.nav_prev,
      { desc = 'Harpoon: navigate to previous [f]ile' }
    )

    vim.keymap.set(
      'n',
      '<leader>fl',
      ui.toggle_quick_menu,
      { desc = 'Harpoon: display [f]ile [l]ist' }
    )

    vim.keymap.set(
      'n',
      '<leader>fh',
      require('harpoon.mark').add_file,
      { desc = 'Harpoon: mark current [f]ile as [h]arpooned' }
    )
  end,
}
