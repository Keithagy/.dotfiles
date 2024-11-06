return {
  {
    "supermaven-inc/supermaven-nvim",
    cmd = "SupermavenStart",
    build = ":SupermavenUsePro",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<C-y>",
          clear_suggestion = "<C-c>",
          accept_word = "<C-j>",
        },
        ignore_filetypes = {}, -- or { "cpp", }
        color = {
          suggestion_color = "#ffffff",
          cterm = 244,
        },
        log_level = "info", -- set to "off" to disable logging completely
        disable_inline_completion = true, -- disables inline completion for use with cmp
        disable_keymaps = false, -- disables built in keymaps for more manual control
        condition = function()
          return false
        end, -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "supermaven-inc/supermaven-nvim",
      },
    },
    opts = function(_, opts)
      table.insert(opts.sources, 1, {
        name = "supermaven",
        group_index = 0,
        priority = 100,
      })
    end,
  },
}