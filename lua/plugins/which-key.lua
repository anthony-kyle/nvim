return {
  {
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function()
      require('which-key').setup {
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
          { ']d', name = 'Next Diagnostic', icon = '󰒡', mode = { 'n', 'v' } },
          { '[d', name = 'Previous Diagnostic', icon = '󰒡', mode = { 'n', 'v' } },
          { '[b', name = 'Previous Buffer', icon = '󰈙', mode = { 'n', 'v' } },
          { ']b', name = 'Next Buffer', icon = '󰈙', mode = { 'n', 'v' } },
          { '<leader>d', group = true, name = '[D]elete', icon = '', mode = { 'n', 'v' } },
          { '<leader>a', name = '[A]dd Harpoon Mark', icon = '', mode = { 'n', 'v' } },
          { '<leader>f', name = '[F]ormat File', icon = '󰉦' },
          { '<leader>p', group = true, name = 'Telesco[p]e', icon = '', mode = { 'n', 'v' } },
          { '<leader>ps', name = 'Telescope GREP [S]earch', icon = '', mode = { 'n', 'v' } },
          { '<leader>pf', name = 'Telescope [F]iles', icon = '', mode = { 'n', 'v' } },
          { '<leader>pg', name = 'Telescope [G]it', icon = '', mode = { 'n', 'v' } },
          { '<leader>e', name = 'Show [E]rrors', icon = '', mode = { 'n', 'v' } },
          { '<leader>k', name = 'Page Down', icon = '', mode = { 'n', 'v' } },
          { '<leader>j', name = 'Page Up', icon = ' ', mode = { 'n', 'v' } },
          { '<leader>s', name = '[S]earch and Replace', icon = '', mode = { 'n', 'v' } },
          { '<leader>i', name = 'Nerd [I]cons', icon = ' ', mode = 'n' },
          { '<leader>u', name = '[U]ndo Tree', icon = '󰏫', mode = { 'n', 'v' } },
          { '<leader>x', name = 'Add E[x]ecute Permission', icon = '󰑮' },
          { '<leader>y', name = '[Y]ank to Clipboard', icon = '󰏓', mode = { 'n', 'v' } },
          { '<leader>Y', name = '[Y]ank to System Clipboard', icon = '󰏓', mode = { 'n', 'v' } },
          { '<leader>g', name = '[G]it', icon = '󰊢', mode = { 'n', 'v' }, group = true },
          { '<leader>gs', name = 'Git [S]tatus', icon = '󰊢', mode = { 'n', 'v' } },
          { '<leader>gb', name = 'Git [Blame]', icon = '󰊢', mode = { 'n', 'v' } },
          { '<leader>m', name = '[M]inimap', icon = '󰕮', mode = { 'n', 'v' } },
          { '<leader>o', name = '[O]il', icon = '', group = true },
          { '<leader>l', name = '[L]azy', icon = '󰒲', group = true, mode = { 'n', 'v' } },
          { '<leader>ld', name = '[L]azy [D]ashboard', icon = '󰒲', mode = 'n' },
        },
      }
    end,
  },
}
