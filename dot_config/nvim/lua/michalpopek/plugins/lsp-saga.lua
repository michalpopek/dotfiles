return {
  'glepnir/lspsaga.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'BufRead',
  config = function()
    require('lspsaga').setup {
      symbol_in_winbar = {
        enable = false,
      },
      lightbulb = {
        enable_in_insert = false,
        virtual_text = false,
      }
    }

    local keymap = vim.keymap.set

    -- LSP finder - Find the symbol's definition
    -- If there is no definition, it will instead be hidden
    -- When you use an action in finder like "open vsplit",
    -- you can use <C-t> to jump back
    keymap('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>')

    -- Code action
    keymap({ 'n', 'v' }, '<leader>ca', '<cmd>Lspsaga code_action<CR>')

    -- Rename all occurrences of the hovered word for the entire file
    keymap('n', 'gr', '<cmd>Lspsaga rename<CR>')

    -- Rename all occurrences of the hovered word for the selected files
    keymap('n', 'gr', '<cmd>Lspsaga rename ++project<CR>')

    -- Peek definition
    -- You can edit the file containing the definition in the floating window
    -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
    -- It also supports tagstack
    -- Use <C-t> to jump back
    keymap('n', 'gd', '<cmd>Lspsaga peek_definition<CR>')

    -- Go to definition
    keymap('n', 'gD', '<cmd>Lspsaga goto_definition<CR>')

    -- Peek type definition
    -- You can edit the file containing the type definition in the floating window
    -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
    -- It also supports tagstack
    -- Use <C-t> to jump back
    keymap('n', 'gt', '<cmd>Lspsaga peek_type_definition<CR>')

    -- Go to type definition
    keymap('n', 'gT', '<cmd>Lspsaga goto_type_definition<CR>')

    -- Show line diagnostics
    -- You can pass argument ++unfocus to
    -- unfocus the show_line_diagnostics floating window
    keymap('n', '<leader>sl', '<cmd>Lspsaga show_line_diagnostics<CR>')

    -- Show cursor diagnostics
    -- Like show_line_diagnostics, it supports passing the ++unfocus argument
    keymap('n', '<leader>sc', '<cmd>Lspsaga show_cursor_diagnostics<CR>')

    -- Show buffer diagnostics
    keymap('n', '<leader>sb', '<cmd>Lspsaga show_buf_diagnostics<CR>')

    -- Diagnostic jump
    -- You can use <C-o> to jump back to your previous location
    keymap('n', 'd[', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
    keymap('n', 'd]', '<cmd>Lspsaga diagnostic_jump_next<CR>')

    -- Toggle outline
    keymap('n', '<leader>o', '<cmd>Lspsaga outline<CR>')
  end,
}
