return {
  -- Provides nice UI notifications for LSP operations
  {
    'j-hui/fidget.nvim',
    event = 'LspAttach',
    opts = {}, -- Use the default options for maximum compatibility
  },
}

