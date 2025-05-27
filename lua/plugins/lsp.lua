return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
      -- Navic (breadcrumbs)
      { 'SmiteshP/nvim-navic' },
    },
    config = function()
      local lsp_zero = require 'lsp-zero'
      local navic = require 'nvim-navic'

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps { buffer = bufnr }
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

        if client.server_capabilities.documentSymbolProvider then
          navic.attach(client, bufnr)
        end
      end)

      require('mason').setup {}
      require('mason-lspconfig').setup {
        ensure_installed = { 'ts_ls', 'eslint', 'html', 'intelephense', 'jsonls' },
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
        },
      }

      local cmp = require 'cmp'
      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      -- Load the snippets
      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup {
        sources = {
          { name = 'path' },
          { name = 'nvim_lsp' },
          { name = 'nvim_lua' },
          { name = 'luasnip', keyword_length = 2 },
          { name = 'buffer', keyword_length = 3 },
        },
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert {
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ['<C-y>'] = cmp.mapping.confirm { select = false },
          ['<C-Space>'] = cmp.mapping.complete(),
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
      }
    end,
  },
}

