return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {},
  },
  {
    'TimUntersberger/neogit',
    opts = {},
    keys = {
      {
        '<leader>g',
        function()
          require('neogit').open()
        end,
        desc = 'Open Neo[g]it tab',
      },
    },
  },
}
