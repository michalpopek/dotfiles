return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    lazy = true,
    config = function()
      -- This is where you modify the settings for lsp-zero
      -- Note: autocompletion settings will not take effect
      require('lsp-zero.settings').preset({})
    end,
  },
  {
    'neovim/nvim-lspconfig',
    cmd = 'LspInfo',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'williamboman/mason-lspconfig.nvim' },
      {
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
    },
    config = function()
      local lsp = require('lsp-zero')

      lsp.ensure_installed({
        'cssls',
        'eslint',
        'jsonls',
        'html',
        'lua_ls',
        'tsserver',
      })

      lsp.format_mapping('gq', {
        servers = {
          -- Add any filetype that has a formatter installed by null-ls
          ['null-ls'] = {
            -- stylelua
            'lua',
            -- prettierd
            'javascript',
            'javascriptreact',
            'typescript',
            'typescriptreact',
            'json',
            'yaml',
            'html',
            'css',
            -- shfmt
            'sh',
            'zsh',
            'bash',
          },
        },
      })

      local lspconfig = require('lspconfig')

      -- Get help for vim builtins etc.
      lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

      -- Don't bother TypeScript with JS files
      lspconfig.tsserver.setup({
        filetypes = {
          'typescript',
          'typescriptreact',
          'typescript.tsx',
        },
      })

      -- Configure Flow (ugh...)
      lspconfig.flow.setup({})

      lsp.set_sign_icons({
        error = '',
        warn = '',
        info = '',
        hint = '',
      })

      lsp.setup()
    end,
  },

  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'onsails/lspkind.nvim',
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      -- The arguments for .extend() have the same shape as `manage_nvim_cmp`:
      -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp
      require('lsp-zero.cmp').extend()

      local cmp = require('cmp')
      local cmp_action = require('lsp-zero.cmp').action()

      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
          { name = 'path' },
          { name = 'luasnip', keyword_length = 2 },
        },
        mapping = {
          ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        },
        formatting = {
          fields = { 'abbr', 'menu', 'kind' },
          format = require('lspkind').cmp_format({
            mode = 'text_symbol',
            maxwidth = 50,
            ellipsis_char = '...',
          }),
        },
      })
    end,
  },
}
