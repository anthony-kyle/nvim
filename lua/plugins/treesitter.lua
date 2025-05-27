return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'help', 'javascript', 'typescript', 'php', 'html', 'css', 'scss', 'c', 'lua', 'vim', 'vimdoc', 'query', 'diff' },
        sync_install = false,
        auto_install = true,
        ignore_install = { 'help' },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end,
  },
  { 'nvim-treesitter/playground' },
}

