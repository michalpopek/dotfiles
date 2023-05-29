return {
  {
    'aserowy/tmux.nvim',
    lazy = false,
    config = {
      copy_sync = { enable = false },
    },
  },
  {
    'kwkarlwang/bufresize.nvim',
    lazy = false,
    config = true,
  },
  {
    'nmac427/guess-indent.nvim',
    event = 'BufEnter',
    opts = {},
  },
  {
    'numToStr/Comment.nvim',
    event = 'BufEnter',
    opts = {},
  },
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'BufEnter',
    config = true,
  },
  {
    'windwp/nvim-autopairs',
    event = 'BufEnter',
    opts = {},
  },
  {
    'norcalli/nvim-colorizer.lua',
    event = 'BufEnter',
    config = true,
  },
}
