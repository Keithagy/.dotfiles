-- default configs: https://github.com/olimorris/codecompanion.nvim/blob/main/lua/codecompanion/config.lua
return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
    "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
    { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } }, -- Optional: For prettier markdown rendering
    { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
  },
  keys = {
    { "<leader>ac", mode = { "n", "v" }, "", desc = "Code Companion.." },
    { "<leader>aca", mode = { "n", "v" }, "<cmd>CodeCompanionActions<cr>", desc = "Code Companion Actions" },
    { "<leader>aci", mode = { "n", "v" }, "<cmd>CodeCompanion<cr>", desc = "Code Companion (Inline)" },
    { "<leader>acc", mode = { "n", "v" }, "<cmd>CodeCompanionChat Toggle<cr>", desc = "Code Companion Chat (Toggle)" },
    {
      "<leader>acr",
      mode = { "v" },
      "<cmd>CodeCompanionChat Add<cr>",
      desc = "Reference selected text in Code Companion Chat buffer",
    },
  },
  opts = {
    adapters = {
      anthropic = function()
        return require("codecompanion.adapters").extend("anthropic", {
          env = {
            api_key = "cmd:op item get claude-api-key-nvim --fields label=credential --reveal",
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = "anthropic",
        slash_commands = {
          ["buffer"] = {
            opts = {
              provider = "telescope", -- default|telescope|mini_pick|fzf_lua
            },
          },
          ["file"] = {
            opts = {
              provider = "telescope", -- default|telescope|mini_pick|fzf_lua
            },
          },
          ["symbols"] = {
            opts = {
              provider = "telescope", -- default|telescope|mini_pick|fzf_lua
            },
          },
        },
      },
      inline = {
        adapter = "anthropic",
      },
    },
  },
}
