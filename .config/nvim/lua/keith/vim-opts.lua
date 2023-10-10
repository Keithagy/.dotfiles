-- enable integration to global clipboard
-- vim.opt.clipboard = 'unnamedplus'
-- Relative line numbers by default
vim.opt.number = true
vim.opt.relativenumber = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not auto-select, nvim-cmp plugin will handle this for us.
vim.o.completeopt = "menuone,noinsert,noselect"

-- Save undo history
vim.o.undofile = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 999
