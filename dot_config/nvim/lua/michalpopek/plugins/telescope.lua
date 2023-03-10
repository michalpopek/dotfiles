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
        return vim.fn.executable 'make' == 1
      end,
    },
    {
      'nvim-telescope/telescope-file-browser.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
  },
  config = function()
    require('telescope').setup {
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
      extensions = {
        file_browser = {
          hijack_netrw = true,
        },
      },
    }

    local telescope = require 'telescope'

    -- Enable telescope fzf native, if installed
    pcall(telescope.load_extension, 'fzf')
    telescope.load_extension 'file_browser'
    local extensions = telescope.extensions

    local builtins = require 'telescope.builtin'

    vim.keymap.set('n', '<leader>b', function()
      extensions.file_browser.file_browser {
        path = vim.fn.expand '%:p:h',
      }
    end, { desc = 'Open file [b]rowser in the current folder' })

    vim.keymap.set('n', '<leader>B', function()
      extensions.file_browser.file_browser()
    end, { desc = 'Open file [b]rowser in the root folder' })

    vim.keymap.set('n', '<leader>?', function()
      builtins.oldfiles { only_cwd = true }
    end, { desc = '[?] Find recently opened files' })

    vim.keymap.set('n', '<leader><space>', function()
      builtins.buffers { sort_lastused = true }
    end, { desc = '[ ] Find existing buffers' })

    vim.keymap.set('n', '<leader>/', function()
      require('telescope.builtin').current_buffer_fuzzy_find()
    end, { desc = '[/] Fuzzily search in current buffer' })

    vim.keymap.set('n', '<leader>sf', function()
      require('telescope.builtin').find_files()
    end, { desc = '[S]earch [F]iles' })

    vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
  end,
}
