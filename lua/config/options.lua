-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Use treesitter for better folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- Don't fold by default when opening files
vim.opt.foldenable = false

-- Python LSP Configuration
-- Use basedpyright (latest fork with more features) instead of pyright
vim.g.lazyvim_python_lsp = "basedpyright"
-- Use ruff for fast linting and formatting
vim.g.lazyvim_python_ruff = "ruff"

-- Disable inlay hints globally (no type annotations)
vim.lsp.inlay_hint.enable(false)
