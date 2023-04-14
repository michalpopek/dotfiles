-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Navigating tabs
vim.keymap.set({ 'n', 'v' }, '<Tab>', '<cmd>tabnext<cr>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<S-Tab>', '<cmd>tabprevious<cr>', { silent = true })

