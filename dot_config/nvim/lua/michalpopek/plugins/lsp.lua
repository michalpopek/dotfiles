-- LSP servers that should installed
local servers = {
  eslint = {},
  html = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
  pyright = {},
  tsserver = {},
}

-- Override filetype association for some LSP servers
local server_to_filetypes = {
  tsserver = { 'typescript', 'typescriptreact', 'typescript.tsx' },
}

return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',

      -- nvim-cmp supports additional completion capabilities
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.lsp.protocol.make_client_capabilities()

      local on_attach = function(_, bufnr)
        vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
          vim.lsp.buf.format()
        end, { desc = 'Format current buffer with LSP' })

        vim.keymap.set('n', '<leader>f', '<cmd>Format<cr>', { desc = '[f]ormat current buffer' })
      end

      -- Setup neovim lua configuration
      require('neodev').setup()

      -- Setup mason so it can manage external tooling
      require('mason').setup()

      -- Ensure the servers above are installed
      local mason_lspconfig = require 'mason-lspconfig'

      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
      }

      mason_lspconfig.setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = server_to_filetypes[server_name],
          }
        end,
      }

      -- Configure additional servers that don't need installation
      require('lspconfig').flow.setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      -- Define signs for diagnostics
      vim.fn.sign_define('DiagnosticSignError', { text = '' })
      vim.fn.sign_define('DiagnosticSignWarn', { text = '' })
      vim.fn.sign_define('DiagnosticSignInfo', { text = ' ' })
      vim.fn.sign_define('DiagnosticSignHint', { text = '' })
    end,
  },
}
