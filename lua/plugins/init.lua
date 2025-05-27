-- This file ensures that lazy.nvim will find all plugin modules
-- Each plugin is defined in its own file

return {
  -- Core plugins that need to be loaded directly
  'nvim-tree/nvim-web-devicons',

  -- Dependencies that might be needed by multiple plugins
  'nvim-lua/plenary.nvim',

  -- Neodev for better Lua development
  {
    'folke/neodev.nvim',
    opts = {},
  },
}

