return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  opts = {
    icons = {
      -- set icon mappings to true if you have a Nerd Font
      mappings = vim.g.have_nerd_font,
      -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
      -- default whick-key.nvim defined Nerd Font icons, otherwise define a string table
      keys = vim.g.have_nerd_font and {} or {
        Up = '<Up> ',
        Down = '<Down> ',
        Left = '<Left> ',
        Right = '<Right> ',
        C = '<C-…> ',
        M = '<M-…> ',
        D = '<D-…> ',
        S = '<S-…> ',
        CR = '<CR> ',
        Esc = '<Esc> ',
        ScrollWheelDown = '<ScrollWheelDown> ',
        ScrollWheelUp = '<ScrollWheelUp> ',
        NL = '<NL> ',
        BS = '<BS> ',
        Space = '<Space> ',
        Tab = '<Tab> ',
        F1 = '<F1>',
        F2 = '<F2>',
        F3 = '<F3>',
        F4 = '<F4>',
        F5 = '<F5>',
        F6 = '<F6>',
        F7 = '<F7>',
        F8 = '<F8>',
        F9 = '<F9>',
        F10 = '<F10>',
        F11 = '<F11>',
        F12 = '<F12>',
      },
    },

    -- Document existing key chains
    spec = {
      { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>r', group = '[R]ename' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>t', group = '[T]oggle' },

      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },

      { '<leader>x', name = 'Add E[x]ecute Permission', icon = '󰑮' },

      { '<leader>i', name = 'Nerd [I]cons', icon = ' ', mode = 'n' },

      { '<leader>y', name = '[Y]ank to Clipboard', icon = '󰏓', mode = { 'n', 'v' } },
      { '<leader>Y', name = '[Y]ank to System Clipboard', icon = '󰏓', mode = { 'n', 'v' } },

      { '<leader>f', name = '[F]uzzy Search', icon = ' ' },
      { '<leader>fw', name = '[F]ind [W]ord', icon = ' ' },
      { '<leader>fl', name = '[F]ind [L]ine', icon = ' ' },

      { '<leader>g', name = '[G]it', icon = '󰊢', mode = { 'n', 'v' }, group = true },
      { '<leader>gs', name = 'Git [S]tatus', icon = '󰊢', mode = { 'n', 'v' } },
      { '<leader>gb', name = 'Git [Blame]', icon = '󰊢', mode = { 'n', 'v' } },

      { '<leader>l', name = '[L]azy', icon = '󰒲', group = true, mode = { 'n', 'v' } },
      { '<leader>ld', name = '[L]azy [D]ashboard', icon = '󰒲', mode = 'n' },

      { '<leader>o', name = '[O]il', icon = '', group = true },

      { '<leader>e', name = 'Show [E]rror under cursor', icon = { icon = '', color = 'red' }, mode = { 'n', 'v' } },

      { 'cs', name = '[C]hange [S]urrounds', icon = '󰌷', mode = { 'n', 'v' } },
      { 'ds', name = '[D]elete [S]urrounds', icon = '󰌷', mode = { 'n', 'v' } },
      { 'ysiw', name = '[W]rap word with surrounds', icon = '󰌷', mode = { 'n', 'v' } },

      { '<leader>m', name = '[M]arks', icon = '󰏓' },
      { '<leader>mc', name = '[M]arks [C]lear All', icon = '󰏓' },
    },
  },
}
