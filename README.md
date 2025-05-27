# Anthony's Neovim Configuration

A modern Neovim configuration using lazy.nvim as the plugin manager.

## Features

- Fast and efficient plugin loading with lazy.nvim
- LSP support with lsp-zero.nvim
- File explorer with oil.nvim
- Beautiful UI with catppuccin theme
- Syntax highlighting with Treesitter
- Git integration with fugitive and gitsigns
- Code minimap with codewindow
- Terminal integration with toggleterm
- And more!

## Requirements

- Neovim >= 0.8.0
- git
- A Nerd Font (optional, for icons)

## Installation

1. Backup your existing Neovim configuration (if any)
2. Clone this repository:

```bash
git clone https://github.com/dajabe/anthony-nvim.git ~/.config/nvim
```

3. Start Neovim:

```bash
nvim
```

The plugin manager (lazy.nvim) will be automatically bootstrapped and all plugins will be installed.

## Structure

- `init.lua`: Main entry point
- `lua/struthious/`: Core configuration
  - `init.lua`: Loads all core modules
  - `set.lua`: Vim options
  - `remap.lua`: Key mappings
- `lua/plugins/`: Plugin specifications
  - Each file contains related plugin configurations

## Keymaps

- `<leader>` is set to space
- File navigation:
  - `<leader>pv`: Open parent directory with oil.nvim
  - `<leader>pf`: Find files with Telescope
  - `<leader>pg`: Find git files
  - `<leader>ps`: Grep search
- LSP:
  - `gd`: Go to definition
  - `K`: Hover documentation
  - `<leader>vd`: Show diagnostics
  - `<leader>vca`: Code actions
  - And more...

## Customization

To customize this configuration, you can modify any of the lua files or add new plugin specifications to the `lua/plugins/` directory.