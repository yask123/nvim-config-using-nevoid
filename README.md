# LazyVim Configuration

This is my Neovim configuration using LazyVim with enhanced TypeScript support and other customizations.

## Features

- LazyVim as the base configuration
- Enhanced TypeScript support with LSP integration
- Toggleterm for integrated terminal
- Custom keymaps for improved workflow

## Installation

### Prerequisites

- Neovim 0.9.0+
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (optional but recommended)

### Setup

1. Clone this repository to your Neovim config directory:

```bash
# Backup your existing config if needed
mv ~/.config/nvim ~/.config/nvim.backup

# Clone the repository
git clone https://github.com/yask123/nvim-config-using-nevoid.git ~/.config/nvim
```

2. Start Neovim:

```bash
nvim
```

LazyVim will automatically install all the required plugins on the first run.

## Key Features

### General Keymaps

- `<leader>w` - Save file
- `<leader>rr` - Run current Ruby file
- `<C-\>` - Toggle terminal

### TypeScript Support

- `<leader>co` - Organize imports
- `<leader>cR` - Rename file and update imports
- Standard LSP functionality (go to definition, find references, etc.)

### Search

- `<leader>sg` - Search for text in project (grep)
- `<leader>sf` - Find files in project
- `<leader>sw` - Search for word under cursor

## Customization

You can customize this configuration by:

1. Editing files in `~/.config/nvim/lua/config/` for general settings
2. Adding or modifying plugins in `~/.config/nvim/lua/plugins/`

## Updating

To update plugins, use the LazyVim update command:

```
:Lazy update
```

## Credits

- [LazyVim](https://github.com/LazyVim/LazyVim) for the excellent base configuration
- All plugin authors for their incredible work
