return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable('make') == 1
      end,
    },
    {
      'nvim-telescope/telescope-file-browser.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
  },
  lazy = false,
  config = function()
    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        buffers = {
          mappings = {
            n = {
              ['d'] = require('telescope.actions').delete_buffer,
            },
            i = {
              ['<C-d>'] = require('telescope.actions').delete_buffer,
            },
          },
        },
        extensions = {
          file_browser = {
            hijack_netrw = true,
            hidden = true,
          },
        },
      },
    })

    local telescope = require('telescope')

    -- Enable telescope fzf native, if installed
    pcall(telescope.load_extension, 'fzf')
    telescope.load_extension('file_browser')

    local builtins = require('telescope.builtin')
    local utils = require('telescope.utils')
    local themes = require('telescope.themes')
    local extensions = telescope.extensions

    vim.keymap.set('n', '<leader>b', function()
      extensions.file_browser.file_browser({ hidden = true })
    end, { desc = 'Open file [b]rowser in the root folder' })

    vim.keymap.set('n', '<leader>B', function()
      extensions.file_browser.file_browser({
        path = utils.buffer_dir(),
        hidden = true,
      })
    end, { desc = 'Open file [b]rowser in buffer directory' })

    vim.keymap.set('n', '<leader>?', function()
      builtins.oldfiles({ only_cwd = true })
    end, { desc = '[?] Find recently opened files' })

    vim.keymap.set('n', '<leader><space>', function()
      builtins.buffers({ sort_mru = true })
    end, { desc = '[ ] Find existing buffers' })

    vim.keymap.set('n', '<leader>/', function()
      builtins.current_buffer_fuzzy_find(themes.get_ivy())
    end, { desc = '[/] Fuzzily search in current buffer' })

    vim.keymap.set(
      'n',
      '<leader>ff',
      builtins.find_files,
      { desc = '[S]earch [f]iles' }
    )

    vim.keymap.set('n', '<leader>fF', function()
      builtins.find_files({ cwd = utils.buffer_dir() })
    end, { desc = '[S]earch [F]iles in buffer directory' })

    vim.keymap.set(
      'n',
      '<leader>fw',
      builtins.grep_string,
      { desc = '[S]earch current [w]ord' }
    )

    vim.keymap.set('n', '<leader>fW', function()
      builtins.grep_string({ cwd = utils.buffer_dir() })
    end, { desc = '[S]earch current [W]ord in buffer directory' })

    vim.keymap.set(
      'n',
      '<leader>fg',
      builtins.live_grep,
      { desc = '[S]earch by [g]rep' }
    )

    vim.keymap.set('n', '<leader>fG', function()
      builtins.live_grep({ cwd = utils.buffer_dir() })
    end, { desc = '[S]earch by [G]rep in buffer directory' })

    vim.keymap.set('n', '<leader>fd', function()
      builtins.diagnostics()
    end, { desc = '[S]earch [d]iagnostics' })

    vim.keymap.set('n', '<leader>fD', function()
      builtins.diagnostics({ bufnr = 0 })
    end, { desc = '[S]earch [D]iagnostics in current buffer' })

    vim.keymap.set(
      'n',
      '<leader>fs',
      builtins.lsp_dynamic_workspace_symbols,
      { desc = '[S]earch [s]ymbols in workspace' }
    )

    vim.keymap.set(
      'n',
      '<leader>fS',
      builtins.lsp_document_symbols,
      { desc = '[S]earch [S]ymbols in current document' }
    )

    vim.keymap.set('n', '<leader>fh', function()
      builtins.help_tags(themes.get_ivy())
    end, { desc = '[S]earch [H]elp' })
  end,
}
