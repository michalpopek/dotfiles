-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Tab navigation coherent with rest of jump keymaps
vim.keymap.set('n', ']t', '<cmd>tabnext<CR>', { silent = true })
vim.keymap.set('n', '[t', '<cmd>tabprev<CR>', { silent = true })
