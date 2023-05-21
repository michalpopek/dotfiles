return {
  'phaazon/hop.nvim',
  config = function()
    require('hop').setup()

    vim.keymap.set(
      { 'n', 'v' },
      '\\w',
      '<cmd>HopWord<cr>',
      { desc = 'Hop to [w]ord' }
    )

    vim.keymap.set(
      { 'n', 'v' },
      '\\l',
      '<cmd>HopLine<cr>',
      { desc = 'Hop to [l]ine' }
    )

    vim.keymap.set(
      { 'n', 'v' },
      '\\a',
      '<cmd>HopAnywhere<cr>',
      { desc = 'Hop to [a]nywhere' }
    )

    vim.keymap.set(
      { 'n', 'v' },
      '\\c',
      '<cmd>HopChar1<cr>',
      { desc = 'Hop to [c]har' }
    )

    vim.keymap.set(
      { 'n', 'v' },
      '\\p',
      '<cmd>HopPattern<cr>',
      { desc = 'Hop to [p]attern' }
    )
  end,
}
