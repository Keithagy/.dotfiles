return {
  "benfowler/telescope-luasnip.nvim",
  keys = {
    { "<leader>fs", "<cmd>Telescope luasnip<cr>", desc = "[F]ind [S]nippets" },
  },
  opts = function()
    require("telescope").load_extension("luasnip")
    return {}
  end,
}
