return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    {
      'williamboman/mason.nvim',
      build = function()
        pcall(vim.cmd.MasonUpdate)
      end,
    },
    {
      'williamboman/mason-lspconfig.nvim',
      dependencies = {
        'neovim/nvim-lspconfig',
      },
    },
    {
      'hrsh7th/nvim-cmp',
      dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'L3MON4D3/LuaSnip',
        'onsails/lspkind.nvim',
      },
    },
  },
  event = 'VeryLazy',
  config = function()
    local lsp = require('lsp-zero').preset({})

    lsp.on_attach(function(_, bufnr)
      lsp.default_keymaps({ buffer = bufnr, preserve_mappings = false })

      local has_telescope, builtins = pcall(require, 'telescope.builtin')
      if has_telescope then
        vim.keymap.set(
          'n',
          'gi',
          builtins.lsp_implementations,
          { buffer = bufnr, desc = 'List LSP implementations' }
        )

        vim.keymap.set(
          'n',
          'gr',
          builtins.lsp_references,
          { buffer = bufnr, desc = 'List LSP references' }
        )

        vim.keymap.set(
          'n',
          'go',
          builtins.lsp_type_definitions,
          { buffer = bufnr, desc = 'List LSP type definitions' }
        )
      end
    end)

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

    lsp.ensure_installed({
      'cssls',
      'eslint',
      'jsonls',
      'html',
      'lua_ls',
      'tsserver',
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

    local cmp = require('cmp')
    local cmp_action = require('lsp-zero').cmp_action()

    cmp.setup({
      window = {
        max_width = 150,
        max_height = 300,
      },
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
}
