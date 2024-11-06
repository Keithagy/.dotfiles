-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local autocmds = {
  BufWritePre = {
    {
      desc = "Trim whitespace before save",
      group = vim.api.nvim_create_augroup("trim-whitespace-before-save", { clear = true }),
      command = [[%s/\s\+$//e]],
    },
  },
}

local function autocmds_setup()
  for event, autocmds_for_event in pairs(autocmds) do
    for _, autocmd in pairs(autocmds_for_event) do
      vim.api.nvim_create_autocmd(event, autocmd)
    end
  end
end

return autocmds_setup
