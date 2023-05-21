return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    hijack_cursor = true,
    sync_root_with_cwd = true,
    update_focused_file = {
      enable = true,
    },
    view = {
      width = '25%',
    },
    renderer = {
      icons = {
        git_placement = 'after',
      },
    },
  },
  keys = {
    { '<leader>e', '<cmd>NvimTreeOpen<cr>', desc = 'Open/focus file tre[e]' },
    { '<leader>E', '<cmd>NvimTreeClose<cr>', desc = 'Clos[E] file tree' },
  },
}
