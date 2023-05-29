return {
  'EdenEast/nightfox.nvim',
  priority = 1000,
  config = function()
    local nightfox = require('nightfox')

    nightfox.setup()

    nightfox.setup({
      groups = {
        all = {
          NvimTreeNormal = { bg = 'NONE' },
        },
      },
    })

    vim.cmd.colorscheme('dayfox')
  end,
}
