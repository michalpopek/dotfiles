return {
  'EdenEast/nightfox.nvim',
  priority = 1000,
  lazy = false,
  config = function()
    require('nightfox').setup()
    vim.cmd.colorscheme('dayfox')
  end,
}
