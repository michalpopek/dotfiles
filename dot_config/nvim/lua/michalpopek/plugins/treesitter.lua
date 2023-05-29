return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'windwp/nvim-ts-autotag',
  },
  build = function()
    pcall(require('nvim-treesitter.install').update({ with_sync = true }))
  end,
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'css',
        'gitcommit',
        'html',
        'javascript',
        'json',
        'markdown',
        'markdown_inline',
        'python',
        'tsx',
        'typescript',
        'yaml',
        'vim',
      },
      auto_install = false,
      autotag = {
        enable = true,
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
        disable = { 'python' },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<S-Space>',
          node_incremental = '<S-Space>',
          node_decremental = '<M-Space>',
          scope_incremental = '<c-s>',
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner',
          },
        },
      },
    })

    vim.treesitter.language.register(
      'tsx',
      { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' }
    )
  end,
}
