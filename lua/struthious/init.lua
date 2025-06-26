require 'struthious.remap'
require 'struthious.set'

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Initialize lazy.nvim with plugins
require('lazy').setup {
  spec = { import = 'plugins' },
  ui = {
    -- If you are using a Nerd Font
    icons = {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🔑',
      plugin = '🔌',
      runtime = '💻',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
}

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_chars = true,
  },
}

-- Set colorscheme after plugins are loaded
vim.cmd.colorscheme 'catppuccin-macchiato'
require('telescope').load_extension('fzf')
