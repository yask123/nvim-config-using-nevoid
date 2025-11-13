# LazyVim Configuration

A modern Neovim configuration using LazyVim with Python, TypeScript support, VSCode-like keybindings, and auto-save functionality.

## Features

- **LazyVim** as the base configuration with sensible defaults
- **Python Development**
  - Basedpyright LSP with minimal type checking
  - Virtual environment selector
  - Auto-import completions
  - Ruff for formatting and linting
- **TypeScript/JavaScript** support with full LSP integration
- **VSCode-like Experience**
  - Auto-save on file changes (1 second debounce)
  - Familiar keybindings (Ctrl+W, Ctrl+/, Tab navigation)
  - 30% terminal height (bottom terminal)
- **Enhanced Editing**
  - Treesitter-based code folding
  - Mini.surround for bracket/quote manipulation
  - Yanky for improved yank/paste
  - FZF for fuzzy finding
  - Inc-rename for live symbol renaming
- **Integrated Terminal** with toggleterm
- **Auto-formatting** with Prettier and Black

## Prerequisites

### Required

- **Neovim 0.10.0+** (check with `nvim --version`)
- **Git** (for cloning and plugin management)
- **Node.js 18+** and npm (for TypeScript LSP and formatters)
- **Python 3.8+** and pip (for Python LSP and tools)
- **A Nerd Font** (for icons) - [Download here](https://www.nerdfonts.com/)

### Recommended

- **ripgrep** (for fast file searching) - `brew install ripgrep`
- **fd** (for fast file finding) - `brew install fd`
- **lazygit** (for git interface) - `brew install lazygit`
- **A terminal with true color support** (iTerm2, Alacritty, Warp, etc.)

## Installation

### Fresh Installation

```bash
# 1. Backup your existing Neovim config (if any)
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
mv ~/.local/state/nvim ~/.local/state/nvim.backup
mv ~/.cache/nvim ~/.cache/nvim.backup

# 2. Clone this repository
git clone https://github.com/yask123/nvim-config-using-nevoid.git ~/.config/nvim

# 3. Start Neovim (plugins will auto-install)
nvim
```

On first launch, LazyVim will:
- Install all plugins automatically
- Download LSP servers via Mason
- Set up Treesitter parsers

**Note:** The first launch may take 2-3 minutes. Let it complete before using Neovim.

### Post-Installation Setup

#### Python Setup

```bash
# Install Python tools globally or in your project venv
pip install ruff black basedpyright

# Or let Mason install them automatically
# Open Neovim and run:
:Mason
# Then install: basedpyright, ruff, black
```

#### TypeScript Setup

```bash
# Install TypeScript tools globally
npm install -g typescript typescript-language-server prettier

# Or let Mason install them automatically
```

#### Select Python Virtual Environment

When working on a Python project:
1. Open a Python file
2. Press `<leader>cv` (space + c + v) to select your virtual environment
3. Or run `:VenvSelect`

## Key Features & Keybindings

**Leader key:** `<space>` (space bar)

### General Keymaps

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>w` | Save file | Quick save current file |
| `<C-w>` | Close buffer | VSCode-style buffer close |
| `<Tab>` | Next buffer | Navigate to next buffer |
| `<S-Tab>` | Previous buffer | Navigate to previous buffer |
| `<C-/>` or `<C-_>` | Toggle comment | VSCode-style commenting |
| `<C-\>` | Toggle terminal | Open/close bottom terminal |

### Python-Specific

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>rr` | Run Python file | Execute current Python file in terminal |
| `<leader>cv` | Select virtualenv | Choose Python virtual environment |
| `gd` | Go to definition | Jump to function/class definition |
| `gr` | Find references | Find all references to symbol |
| `K` | Show documentation | Show hover documentation |

### Code Navigation

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>ff` | Find files | Fuzzy find files in project |
| `<leader>fg` | Live grep | Search text in all files |
| `<leader>fb` | Find buffers | List open buffers |
| `<leader>fh` | Find help | Search Neovim help |
| `<leader>e` | File explorer | Toggle Neo-tree file explorer |
| `<leader>gg` | Lazygit | Open Lazygit interface |

### LSP Features

| Key | Action | Description |
|-----|--------|-------------|
| `gd` | Go to definition | Jump to symbol definition |
| `gr` | Find references | Find all symbol references |
| `gi` | Go to implementation | Jump to implementation |
| `K` | Hover docs | Show documentation |
| `<leader>ca` | Code actions | Show available code actions |
| `<leader>cr` | Rename symbol | Rename symbol across project |
| `<leader>cf` | Format document | Format current file |

### Editing Enhancements

| Key | Action | Description |
|-----|--------|-------------|
| `sa{motion}{char}` | Add surround | Surround with brackets/quotes |
| `sd{char}` | Delete surround | Remove surrounding brackets/quotes |
| `sr{old}{new}` | Replace surround | Change surrounding character |
| `p` / `P` | Paste | Enhanced paste with yanky |
| `]p` / `[p` | Cycle paste | Cycle through yank history |

### Window Management

| Key | Action | Description |
|-----|--------|-------------|
| `<C-h/j/k/l>` | Navigate windows | Move between splits |
| `<leader>ww` | Other window | Switch to other window |
| `<leader>wd` | Delete window | Close current window |
| `<leader>-` | Split below | Horizontal split |
| `<leader>\|` | Split right | Vertical split |

## Configuration Structure

```
~/.config/nvim/
├── init.lua                 # Entry point (loads lazy.nvim)
├── lua/
│   ├── config/
│   │   ├── autocmds.lua     # Auto-commands
│   │   ├── keymaps.lua      # Custom keybindings
│   │   ├── lazy.lua         # Lazy.nvim setup & plugin imports
│   │   └── options.lua      # Neovim options & LSP config
│   └── plugins/
│       ├── init.lua         # Core plugins (toggleterm, auto-save)
│       ├── python.lua       # Python-specific configuration
│       └── example.lua      # LazyVim example (can be deleted)
├── lazy-lock.json           # Locked plugin versions
└── lazyvim.json             # LazyVim configuration
```

## Customization

### Adding Custom Keymaps

Edit `lua/config/keymaps.lua`:

```lua
vim.keymap.set("n", "<leader>xx", ":YourCommand<CR>", {
  desc = "Description"
})
```

### Adding New Plugins

Create a new file in `lua/plugins/your-plugin.lua`:

```lua
return {
  "author/plugin-name",
  event = "VeryLazy",
  config = function()
    require("plugin-name").setup({
      -- your config here
    })
  end,
}
```

### Modifying Options

Edit `lua/config/options.lua` for Neovim options or LSP settings.

### Changing Theme

LazyVim comes with multiple themes. To switch:

```
:Lazy
# Navigate to LazyVim and press 'x' to open LazyVim menu
# Select 'Colorschemes' to change themes
```

## Auto-Save Behavior

Auto-save triggers:
- 1 second after you stop typing
- When leaving insert mode
- Only saves the current buffer (not all buffers)
- Disabled for special buffers (terminal, file explorer, etc.)

To disable auto-save, comment out the auto-save plugin in `lua/plugins/init.lua`.

## Python Configuration

### LSP Settings

- **basedpyright**: Provides completions and basic error checking
- **Type checking**: Disabled by default (set to "off" for minimal noise)
- **Diagnostics**: Only syntax errors shown, type errors suppressed
- **Inlay hints**: Disabled (no inline type annotations)
- **Ruff**: Used for formatting only, diagnostics disabled

To enable stricter type checking, edit `lua/plugins/python.lua`:

```lua
typeCheckingMode = "basic" -- or "strict"
```

### Virtual Environment Detection

The config auto-detects virtual environments in:
- `./venv`
- `./.venv`
- `./env`
- `~/.virtualenvs/`
- Conda environments

## Updating

### Update All Plugins

```
:Lazy update
```

### Update Specific Plugin

```
:Lazy
# Press 'u' on the plugin you want to update
```

### Update LSP Servers

```
:Mason
# Press 'U' to update all, or 'u' on specific server
```

### Update This Config

```bash
cd ~/.config/nvim
git pull origin master
```

## Troubleshooting

### Plugins Not Installing

```
:Lazy restore  # Restore to exact versions in lazy-lock.json
:Lazy sync     # Re-sync all plugins
```

### LSP Not Working

```
:LspInfo       # Check if LSP is attached
:Mason         # Ensure LSP servers are installed
:checkhealth   # Run full health check
```

### Python LSP Issues

```
# Check if basedpyright is installed
:Mason
# Look for 'basedpyright' and install if missing

# Check if virtual environment is selected
:VenvSelect
```

### Slow Startup

```
# Profile startup time
nvim --startuptime startup.log
# Check which plugins are slow
```

### Terminal Colors Wrong

Ensure your terminal supports true color:
```bash
# Add to your shell config (.zshrc or .bashrc)
export TERM=xterm-256color
```

## Best Practices

### For Python Development

1. **Always use virtual environments** - Select with `<leader>cv`
2. **Install dev tools in venv** - `pip install ruff black basedpyright`
3. **Use type hints** - Better completions even with type checking off
4. **Format on save** - Enabled by default with Black

### For TypeScript Development

1. **Use project-local TypeScript** - Install `typescript` in your project
2. **Configure ESLint** - Works automatically if `.eslintrc` exists
3. **Use Prettier** - Auto-formats on save

### General Tips

1. **Learn the leader key shortcuts** - Most powerful features use `<leader>`
2. **Use Telescope** - `<leader>f` prefix for all search operations
3. **Master LSP keybindings** - `gd`, `gr`, `K` are essential
4. **Customize gradually** - Start with defaults, customize as needed
5. **Check health regularly** - `:checkhealth` catches issues early

## Uninstalling

To completely remove this config:

```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

# Restore backup if you made one
mv ~/.config/nvim.backup ~/.config/nvim
```

## FAQ

**Q: Why basedpyright instead of pyright?**
A: Basedpyright is a community fork with better performance and more features, while maintaining compatibility.

**Q: Can I disable auto-save?**
A: Yes, comment out the auto-save plugin in `lua/plugins/init.lua` and restart Neovim.

**Q: How do I change the terminal height?**
A: Edit the `size` function in `lua/plugins/init.lua` (currently set to 30%).

**Q: Why are type errors not showing?**
A: By design - type checking is set to "off" for minimal noise. Enable in `lua/plugins/python.lua`.

**Q: Can I use this with Vim?**
A: No, this requires Neovim 0.10+. It won't work with classic Vim.

## Resources

- [LazyVim Documentation](https://lazyvim.github.io/)
- [Neovim Documentation](https://neovim.io/doc/)
- [LazyVim Keymaps](https://www.lazyvim.org/keymaps)
- [Mason Registry](https://mason-registry.dev/) (LSP servers)
- [This Config Repository](https://github.com/yask123/nvim-config-using-nevoid)

## Credits

- [LazyVim](https://github.com/LazyVim/LazyVim) - Excellent base configuration
- [Neovim](https://github.com/neovim/neovim) - The editor itself
- All plugin authors for their incredible work

## License

MIT License - See LICENSE file for details
