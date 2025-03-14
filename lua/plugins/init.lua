return {
  -- other plugins
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        -- configuration options
        size = 20,
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
}
