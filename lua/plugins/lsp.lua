return {
  -- LSP Configuration
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Useful status updates for LSP (already configured in init.lua)
      { 'j-hui/fidget.nvim' },

      -- Additional lua configuration, makes nvim stuff amazing!
      { 'folke/neodev.nvim' },

      -- Breadcrumbs navigation
      { 'SmiteshP/nvim-navic' },
    },
    config = function()
      -- Setup neovim lua configuration
      require('neodev').setup()

      -- Setup mason so it can manage external tooling
      require('mason').setup()

      -- Define on_attach function with all the keymaps
      local on_attach = function(client, bufnr)
        -- Keymaps
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set('n', 'gd', function()
          vim.lsp.buf.definition()
        end, opts)
        vim.keymap.set('n', 'K', function()
          vim.lsp.buf.hover()
        end, opts)
        vim.keymap.set('n', '<leader>vws', function()
          vim.lsp.buf.workspace_symbol()
        end, opts)
        vim.keymap.set('n', '<leader>vd', function()
          vim.diagnostic.open_float()
        end, opts)
        vim.keymap.set('n', '[d', function()
          vim.diagnostic.goto_next()
        end, opts)
        vim.keymap.set('n', ']d', function()
          vim.diagnostic.goto_prev()
        end, opts)
        vim.keymap.set('n', '<leader>vca', function()
          vim.lsp.buf.code_action()
        end, opts)
        vim.keymap.set('n', '<leader>vrr', function()
          vim.lsp.buf.references()
        end, opts)
        vim.keymap.set('n', '<leader>vrn', function()
          vim.lsp.buf.rename()
        end, opts)
        vim.keymap.set('i', '<C-h>', function()
          vim.lsp.buf.signature_help()
        end, opts)

        -- Attach navic (breadcrumbs) if supported
        if client.server_capabilities.documentSymbolProvider then
          require('nvim-navic').attach(client, bufnr)
        end
      end

      -- Enable the following language servers
      -- Feel free to add/remove any LSPs that you want here. They will automatically be installed
      local servers = {
        'ts_ls', -- Replaced tsserver with ts_ls
        'eslint',
        'html',
        'intelephense',
        'jsonls',
        'lua_ls',
      }

      -- Ensure the servers above are installed
      require('mason-lspconfig').setup {
        ensure_installed = servers,
      }

      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      -- Manual LSP server setup (instead of using setup_handlers)
      local lspconfig = require 'lspconfig'

      -- Setup each server
      for _, server in ipairs(servers) do
        if server == 'lua_ls' then
          -- Special setup for lua_ls
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
              Lua = {
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
                -- Make the server aware of Neovim runtime files
                library = {
                  vim.api.nvim_get_runtime_file('', true),
                  '${3rd}/luv/library',
                  '${3rd}/busted/library',
                },
                diagnostics = {
                  globals = { 'vim' },
                },
              },
            },
          }
        else
          -- Default setup for other servers
          lspconfig[server].setup {
            capabilities = capabilities,
            on_attach = on_attach,
          }
        end
      end

      -- Diagnostics configuration
      vim.diagnostic.config {
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
          border = 'rounded',
          source = 'always',
        },
      }

      -- Set diagnostics signs
      local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
      for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end,
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        dependencies = {
          'rafamadriz/friendly-snippets',
        },
      },
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      -- Load snippets
      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          ---@diagnostic disable-next-line: undefined-field
          completion = cmp.config.window.bordered(),
          ---@diagnostic disable-next-line: undefined-field
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<C-y>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          },
        },
        ---@diagnostic disable-next-line: undefined-field
        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
          { name = 'buffer' },
        },
        formatting = {
          format = function(entry, vim_item)
            -- Source
            vim_item.menu = ({
              buffer = '[Buffer]',
              nvim_lsp = '[LSP]',
              luasnip = '[Snippet]',
              path = '[Path]',
            })[entry.source.name]
            return vim_item
          end,
        },
      }
    end,
  },
}

