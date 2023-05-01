return {
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufEnter',
    opts = {
      current_line_blame = true,
    },
  },
  {
    'tpope/vim-fugitive',
    dependencies = { 'tpope/vim-rhubarb' },
    cmd = { 'Git', 'G' },
  },
}
