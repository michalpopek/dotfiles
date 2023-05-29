return {
  {
    'tpope/vim-fugitive',
    dependencies = { 'tpope/vim-rhubarb' },
    event = 'VeryLazy',
  },
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufEnter',
    config = function()
      local gitsigns = require('gitsigns')

      gitsigns.setup({
        current_line_blame = true,
        on_attach = function()
          vim.keymap.set(
            'n',
            ']g',
            gitsigns.next_hunk,
            { desc = 'Next Git hunk' }
          )

          vim.keymap.set(
            'n',
            '[g',
            gitsigns.prev_hunk,
            { desc = 'Previous Git hunk' }
          )

          vim.keymap.set(
            'n',
            '<leader>gp',
            gitsigns.preview_hunk,
            { desc = '[G]it: [p]review hunk' }
          )

          vim.keymap.set(
            'n',
            '<leader>gsh',
            gitsigns.stage_hunk,
            { desc = '[G]it: [s]tage hunk' }
          )

          vim.keymap.set(
            'n',
            '<leader>guh',
            gitsigns.undo_stage_hunk,
            { desc = '[G]it: [u]ndo [h]unk staging' }
          )

          vim.keymap.set(
            'n',
            '<leader>grh',
            gitsigns.reset_hunk,
            { desc = '[G]it: [r]eset hunk' }
          )

          vim.keymap.set(
            'n',
            '<leader>gsb',
            gitsigns.stage_buffer,
            { desc = '[G]it: [s]tage buffer' }
          )

          vim.keymap.set(
            'n',
            '<leader>grb',
            gitsigns.reset_buffer,
            { desc = '[G]it: [r]eset [b]uffer' }
          )
        end,
      })
    end,
  },
  {
    'akinsho/git-conflict.nvim',
    opts = {
      default_mappings = {
        ours = '<leader>gco',
        theirs = '<leader>gct',
        none = '<leader>gcn',
        both = '<leader>gcb',
        next = ']x',
        prev = '[x',
      },
    },
  },
}
