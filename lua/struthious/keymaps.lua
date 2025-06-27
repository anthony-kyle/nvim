-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set shortcut to launch Oil a netrw replacement
vim.keymap.set('n', '-', '<CMD>Oil --float<CR>', { desc = 'Open oil file browser floating' })
vim.keymap.set('n', '<leader>oo', '<CMD>Oil<CR>', { desc = 'Open oil file browser in new window' })
vim.keymap.set('n', '<leader>ov', '<CMD>vertical Oil<CR>', { desc = 'Open oil file browser in a vertical pane' })
vim.keymap.set('n', '<leader>oh', '<CMD>belowright Oil<CR>', { desc = 'Open oil file browser in a horizontal pane' })

-- Paste contents of clipboard over current selection
vim.keymap.set('x', '<leader>p', [["_dP]])

-- Copy the the current file path to clipboard
vim.keymap.set('n', '<leader>cp', function()
  vim.fn.setreg('*', vim.fn.expand '%')
end, { desc = 'Copy current file path to system clipboard' })

-- Show messages in Telescope picker
vim.keymap.set('n', '<leader>ce', function()
  require('dajabe.messages').show_messages_picker()
end, { desc = 'Show messages in Telescope picker' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<leader>Q', ':qa<CR>', { desc = '[Q]uit [A]ll windows if no changes made' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>ov', '<CMD>Oil<CR>', { desc = 'Open parent dir' })
vim.keymap.set('n', '<leader>oc', '<CMD>Oil --float <CR>', { desc = 'Open parent dir' })
vim.keymap.set('n', '-', '<CMD>Oil --float <CR>', { desc = 'Open parent dir' })

vim.keymap.set('n', '<C-w>w', '<CMD>bdelete<CR>', { desc = 'Close buffer' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

-- This is going to get me cancelled
vim.keymap.set('i', '<C-c>', '<Esc>')

vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)

vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set('v', '<leader>s', [[:s/\(.*\)/\1<Left><Left>]])
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

-- This was for Packer, we now use lazy.nvim
vim.keymap.set('n', '<leader>ld', function()
  require('lazy').home()
end, { desc = 'Open Lazy dashboard' })

vim.keymap.set('n', '<leader>i', '<CMD>NerdIcons<CR>', { desc = 'Show Nerd Icons' })
