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
  },
  lazy = false,
  config = function()
    require('telescope').setup({
      defaults = {
        prompt_prefix = '   ',
        sorting_strategy = 'ascending',
        layout_strategy = 'horizontal',
        layout_config = {
          horizontal = {
            prompt_position = 'top',
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
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
      },
    })

    local telescope = require('telescope')

    -- Enable telescope fzf native, if installed
    pcall(telescope.load_extension, 'fzf')

    local builtins = require('telescope.builtin')
    local utils = require('telescope.utils')
    local themes = require('telescope.themes')

    vim.keymap.set('n', '<leader>?', function()
      builtins.oldfiles({ only_cwd = true })
    end, { desc = '[?] Find recently opened files' })

    vim.keymap.set('n', '<leader><space>', function()
      builtins.buffers({ sort_mru = true })
    end, { desc = '[ ] Find existing buffers' })

    vim.keymap.set('n', '<leader>/', function()
      builtins.current_buffer_fuzzy_find(themes.get_ivy())
    end, { desc = '[/] Fuzzily search in current buffer' })

    local function search_files(opts)
      opts = opts or {}
      local ok = pcall(
        builtins.git_files,
        vim.tbl_extend('keep', opts, { show_untracked = true })
      )
      if not ok then
        builtins.find_files(opts)
      end
    end

    vim.keymap.set(
      'n',
      '<leader>sf',
      search_files,
      { desc = '[S]earch [f]iles' }
    )

    vim.keymap.set('n', '<leader>sF', function()
      search_files({ cwd = utils.buffer_dir() })
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

    vim.keymap.set('n', '<leader>sd', function()
      builtins.diagnostics()
    end, { desc = '[S]earch [d]iagnostics' })

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
      '<leader>\\',
      builtins.resume,
      { desc = '[\\] Resume last picker' }
    )

    vim.keymap.set(
      'n',
      '<leader>sj',
      builtins.jumplist,
      { desc = '[S]earch [j]umplist' }
    )

    vim.keymap.set(
      'n',
      '<leader>sr',
      builtins.registers,
      { desc = '[S]earch [r]egisters' }
    )

    vim.keymap.set(
      'n',
      '<leader>sm',
      builtins.marks,
      { desc = '[S]earch [m]arks' }
    )

    vim.keymap.set('n', '<leader>sh', function()
      builtins.help_tags()
    end, { desc = '[S]earch [H]elp' })
  end,
}
