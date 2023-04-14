return {
  'nvim-telescope/telescope.nvim',
  version = '*',
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
  config = function()
    require('telescope').setup({
      defaults = {
        sorting_strategy = 'ascending',
        layout_config = {
          prompt_position = 'top',
        },
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
      },
      extensions = {
        file_browser = {
          hijack_netrw = true,
          hidden = true,
        },
      },
    })

    local telescope = require('telescope')

    -- Enable telescope fzf native, if installed
    pcall(telescope.load_extension, 'fzf')
    telescope.load_extension('file_browser')

    local builtins = require('telescope.builtin')
    local utils = require('telescope.utils')
    local extensions = telescope.extensions

    vim.keymap.set(
      'n',
      '<leader>b',
      extensions.file_browser.file_browser,
      { desc = 'Open file [b]rowser in the root folder' }
    )

    vim.keymap.set('n', '<leader>B', function()
      extensions.file_browser.file_browser({ path = utils.buffer_dir() })
    end, { desc = 'Open file [b]rowser in buffer directory' })

    vim.keymap.set('n', '<leader>?', function()
      builtins.oldfiles({ only_cwd = true })
    end, { desc = '[?] Find recently opened files' })

    vim.keymap.set('n', '<leader><space>', function()
      builtins.buffers({ sort_lastused = true })
    end, { desc = '[ ] Find existing buffers' })

    vim.keymap.set('n', '<leader>/', function()
      builtins.current_buffer_fuzzy_find()
    end, { desc = '[/] Fuzzily search in current buffer' })

    vim.keymap.set(
      'n',
      '<leader>sf',
      builtins.find_files,
      { desc = '[S]earch [f]iles' }
    )

    vim.keymap.set('n', '<leader>sF', function()
      builtins.find_files({ cwd = utils.buffer_dir() })
    end, { desc = '[S]earch [F]iles in buffer directory' })

    vim.keymap.set(
      'n',
      '<leader>sw',
      builtins.grep_string,
      { desc = '[S]earch current [w]ord' }
    )

    vim.keymap.set('n', '<leader>sW', function()
      builtins.grep_string({ cwd = utils.buffer_dir() })
    end, { desc = '[S]earch current [W]ord in buffer directory' })

    vim.keymap.set(
      'n',
      '<leader>sg',
      builtins.live_grep,
      { desc = '[S]earch by [g]rep' }
    )

    vim.keymap.set('n', '<leader>sG', function()
      builtins.live_grep({ cwd = utils.buffer_dir() })
    end, { desc = '[S]earch by [G]rep in buffer directory' })

    vim.keymap.set(
      'n',
      '<leader>sd',
      builtins.diagnostics,
      { desc = '[S]earch [d]iagnostics' }
    )

    vim.keymap.set('n', '<leader>sD', function()
      builtins.diagnostics({ bufnr = 0 })
    end, { desc = '[S]earch [D]iagnostics in current buffer' })

    vim.keymap.set(
      'n',
      '<leader>ss',
      builtins.lsp_dynamic_workspace_symbols,
      { desc = '[S]earch [s]ymbols in workspace' }
    )

    vim.keymap.set(
      'n',
      '<leader>sS',
      builtins.lsp_document_symbols,
      { desc = '[S]earch [S]ymbols in current document' }
    )

    vim.keymap.set(
      'n',
      '<leader>sh',
      builtins.help_tags,
      { desc = '[S]earch [H]elp' }
    )
  end,
}
