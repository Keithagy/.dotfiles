-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.scrolloff = 20
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "a"
vim.opt.updatetime = 50 -- Decrease update time
vim.opt.timeoutlen = 200
vim.opt.laststatus = 2

vim.opt.list = true
vim.opt.listchars = {
  space = "⋅", -- spaces
  eol = "↲", -- end-of-line chars
  tab = "» ", -- tabs
  trail = "·", -- trailing spaces
  extends = "❯", -- Show when line continues beyond right
  precedes = "❮", -- Show when line continues beyond left
  nbsp = "␣", -- Show non-breakable spaces
  multispace = "···", -- Show multiple spaces as dots
  lead = "·", -- Show leading spaces
}

vim.opt.inccommand = "split"
