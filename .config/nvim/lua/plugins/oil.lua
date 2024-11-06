return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  enabled = false,
  keys = {
    { "<leader>e", "<cmd>Oil .<cr>", { desc = "Open oil" } },
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
