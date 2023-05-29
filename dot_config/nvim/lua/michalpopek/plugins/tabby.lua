return {
  'nanozuki/tabby.nvim',
  config = function()
    vim.o.showtabline = 2
    require('tabby.tabline').use_preset('active_wins_at_tail')
  end,
}
