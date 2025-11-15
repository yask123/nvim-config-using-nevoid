-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Run Python file in bottom terminal
vim.keymap.set("n", "<leader>rr", function()
  local file = vim.fn.expand("%:p")
  -- Open terminal at bottom and run command
  vim.cmd(string.format("TermExec cmd='python \"%s\"' direction=horizontal", file))
end, { noremap = true, silent = true, desc = "Run Python file" })

-- Toggle Claude chat sidebar on the right (20% width)
vim.keymap.set("n", "<leader>cc", function()
  -- Check if Claude sidebar already exists
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local buf_name = vim.api.nvim_buf_get_name(buf)
    if buf_name:match("term://.*claude") then
      -- Close the window if it exists
      vim.api.nvim_win_close(win, false)
      return
    end
  end

  -- Create new vertical split on the right (20% width)
  vim.cmd("botright vsplit")
  vim.cmd("vertical resize 20%")

  -- Open terminal and run Claude
  vim.cmd("terminal claude")

  -- Enter insert mode in terminal
  vim.cmd("startinsert")
end, { noremap = true, silent = true, desc = "Toggle Claude chat sidebar" })

vim.api.nvim_set_keymap("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })

-- Close current buffer with <leader>bd (keeps <C-w> for window commands)
vim.keymap.set("n", "<leader>bd", function()
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

-- Close all other buffers (keep only current one)
vim.keymap.set("n", "<leader>bo", function()
  local current_buf = vim.api.nvim_get_current_buf()
  local has_bufremove, bufremove = pcall(require, "mini.bufremove")

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    -- Only delete other buffers that are loaded and not special buffers
    if buf ~= current_buf and vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
      if has_bufremove then
        bufremove.delete(buf, false)
      else
        vim.api.nvim_buf_delete(buf, { force = false })
      end
    end
  end
end, { noremap = true, silent = true, desc = "Close all other buffers" })
