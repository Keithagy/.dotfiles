-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without yanking selection" })

vim.keymap.set({ "n" }, "<leader>ws", function()
  require("window-picker").pick_window()
end, { desc = "Select window" })

vim.keymap.set({ "n" }, "<leader>wz", [[:ZenMode<CR>]], { desc = "Toggle zen mode for current window" })

-- disable lazyvim default mappings
vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")
vim.keymap.del("n", "[b")
vim.keymap.del("n", "]b")
vim.keymap.del("n", "<leader>bb")
vim.keymap.del("n", "<leader>`")
