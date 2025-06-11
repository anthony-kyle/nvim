vim.g.mapleader = ' '
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

vim.keymap.set('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>')

vim.keymap.set('n', '<leader>i', '<CMD>NerdIcons<CR>', { desc = 'Show Nerd Icons' })
