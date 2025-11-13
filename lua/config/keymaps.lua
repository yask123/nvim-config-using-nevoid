-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Run Python file in bottom terminal
vim.keymap.set("n", "<leader>rr", function()
  local file = vim.fn.expand("%:p")
  -- Open terminal at bottom and run command
  vim.cmd(string.format("TermExec cmd='python \"%s\"' direction=horizontal", file))
end, { noremap = true, silent = true, desc = "Run Python file" })

vim.api.nvim_set_keymap("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })

-- Close current buffer with Ctrl+W (VSCode-style, overrides window commands)
vim.keymap.set("n", "<C-w>", function()
  -- Try to use LazyVim's buffer delete if available, otherwise use bdelete
  local has_bufremove, bufremove = pcall(require, "mini.bufremove")
  if has_bufremove then
    bufremove.delete(0, false)
  else
    vim.cmd("bdelete")
  end
end, { noremap = true, silent = true, desc = "Close buffer" })

-- Navigate buffers (terminal-friendly alternatives)
-- Using Shift+Tab (previous) and Tab (next) in normal mode
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
-- Alternative: Shift+H (left) and Shift+L (right) are also available by default

-- Toggle comments with Ctrl+/ (VSCode-style)
-- Note: Different terminals send Ctrl+/ differently:
-- Most terminals: <C-_> (Ctrl+underscore)
-- Some terminals: <C-/> directly
vim.keymap.set("n", "<C-_>", "gcc", { remap = true, silent = true, desc = "Toggle comment" })
vim.keymap.set("v", "<C-_>", "gc", { remap = true, silent = true, desc = "Toggle comment" })
vim.keymap.set("n", "<C-/>", "gcc", { remap = true, silent = true, desc = "Toggle comment" })
vim.keymap.set("v", "<C-/>", "gc", { remap = true, silent = true, desc = "Toggle comment" })

-- Also support Cmd+/ for GUI Neovim or terminals that support it (like Warp)
vim.keymap.set("n", "<D-/>", "gcc", { remap = true, silent = true, desc = "Toggle comment" })
vim.keymap.set("v", "<D-/>", "gc", { remap = true, silent = true, desc = "Toggle comment" })
