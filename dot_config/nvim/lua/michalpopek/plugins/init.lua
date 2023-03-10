-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  { import = 'michalpopek.plugins.colorschemes' },
  { import = 'michalpopek.plugins.treesitter' },
  { import = 'michalpopek.plugins.telescope' },
  { import = 'michalpopek.plugins.lsp' },
  { import = 'michalpopek.plugins.lsp-saga' },
  { import = 'michalpopek.plugins.cmp' },
  { import = 'michalpopek.plugins.null-ls' },
  { import = 'michalpopek.plugins.lualine' },
  { import = 'michalpopek.plugins.smart-splits' },
  { import = 'michalpopek.plugins.indent-blankline' },
  { import = 'michalpopek.plugins.git' },
  { import = 'michalpopek.plugins.auto-session' },
  { 'numToStr/Comment.nvim', opts = {} },
  'tpope/vim-sleuth',
}
