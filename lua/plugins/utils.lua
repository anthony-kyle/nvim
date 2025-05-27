return {
  -- Vim commentary for commenting code
  {
    'tpope/vim-commentary',
  },

  -- GitHub Copilot
  {
    'github/copilot.vim',
  },

  -- Vim surround for manipulating pairs
  {
    'tpope/vim-surround',
  },

  -- Terminal integration
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        open_mapping = [[<c-\>]],
      }
    end,
  },
}

