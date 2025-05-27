return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
    end,
  },
  {
    'tveskag/nvim-blame-line',
    config = function()
      vim.keymap.set('n', '<leader>gb', vim.cmd.ToggleBlameLine)
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  },
}

