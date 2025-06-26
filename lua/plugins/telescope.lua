return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    defaults = {
      layout_config = {
        vertical = { width = 0.5 }
        -- other layout configuration here
      },
    },
    config = function()
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
      vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
      vim.keymap.set('n', '<leader>ps', function()
        builtin.grep_string { search = vim.fn.input 'Grep > ' }
      end)
      vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>po', builtin.oldfiles, {})
      vim.keymap.set('n', '<leader>pc', builtin.commands, {})
      vim.keymap.set('n', '<leader>ph', builtin.search_history, {})
    end,
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
}

