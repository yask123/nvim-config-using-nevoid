# Quick Start Guide

## Installation (30 seconds)

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.backup

# Clone and start
git clone https://github.com/yask123/nvim-config-using-nevoid.git ~/.config/nvim
nvim
```

Wait 2-3 minutes for plugins to install on first launch.

## Essential Keybindings

Leader key = `<space>`

### Must-Know Commands

| Key | Action |
|-----|--------|
| `<leader>w` | Save file |
| `<C-w>` | Close buffer (VSCode-style) |
| `<C-/>` | Toggle comment |
| `<leader>rr` | Run Python file |
| `<leader>ff` | Find files |
| `<leader>fg` | Search in files (grep) |
| `<leader>e` | File explorer |
| `gd` | Go to definition |
| `K` | Show docs |

### Buffer Navigation

| Key | Action |
|-----|--------|
| `<Tab>` | Next buffer |
| `<S-Tab>` | Previous buffer |

### Terminal

| Key | Action |
|-----|--------|
| `<C-\>` | Toggle terminal |

## Python Setup

```bash
# Install tools
pip install ruff black basedpyright

# In Neovim, select virtualenv
<space>cv
```

## Common Commands

```vim
:Lazy                  " Manage plugins
:Mason                 " Install LSP servers
:checkhealth           " Health check
:VenvSelect            " Select Python venv
:LspInfo               " Check LSP status
```

## Troubleshooting

**Plugins not working?**
```vim
:Lazy restore
:Lazy sync
```

**LSP not working?**
```vim
:LspInfo
:Mason
```

**Need help?**
```vim
:help
:Tutor
```

## Next Steps

1. Read full [README.md](README.md) for detailed docs
2. Customize in `lua/config/` and `lua/plugins/`
3. Learn more keybindings with `<leader>?` (which-key)

## Auto-Save

Files automatically save 1 second after you stop typing. No need to save manually!

## Resources

- Full docs: See [README.md](README.md)
- LazyVim: https://lazyvim.github.io/
- Keymaps: https://www.lazyvim.org/keymaps
