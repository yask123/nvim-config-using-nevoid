return {
  -- Add mini.comment for commenting functionality
  {
    "nvim-mini/mini.comment",
    event = "VeryLazy",
    opts = {
      options = {
        custom_commentstring = nil,
      },
    },
  },

  -- other plugins
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        -- configuration options
        size = function(term)
          if term.direction == "horizontal" then
            return vim.o.lines * 0.3 -- 30% of screen height (VSCode-like)
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
        open_mapping = [[<c-\>]],
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = "1",
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "horizontal", -- or 'vertical', 'tab', 'float'
      })
    end,
  },
  
  -- TypeScript support
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- Python support with basedpyright LSP
  { import = "lazyvim.plugins.extras.lang.python" },

  -- Auto-save like VSCode/Zed
  {
    "pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup({
        enabled = true,
        execution_message = {
          message = "", -- Disable save message to keep it clean
        },
        trigger_events = { "InsertLeave", "TextChanged" }, -- Save when leaving insert mode or text changes
        condition = function(buf)
          local fn = vim.fn
          local utils = require("auto-save.utils.data")

          -- Don't auto-save special buffers
          if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
            return true
          end
          return false
        end,
        write_all_buffers = false, -- Only save current buffer
        debounce_delay = 1000, -- Wait 1 second after typing stops before saving
      })
    end,
  },
}
