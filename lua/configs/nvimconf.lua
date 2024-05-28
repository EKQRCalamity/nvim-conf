-- Set intend
local TABWIDTH = 2

-- Change Cursor Color in insert mode
require("configs.animatecursor")

-- Change Cursor in normal mode to reverse
vim.cmd("highlight Cursor gui=reverse")
vim.cmd("highlight lCursor gui=reverse")

-- Enable 24bit terminal colors
vim.opt.termguicolors = true

-- Set leader and local leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Disable netrw for NvimTree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable Line Numbers
vim.wo.nu = true
vim.wo.rnu = true

-- Tabwidth, etc
vim.opt.shiftwidth = TABWIDTH
vim.opt.softtabstop = TABWIDTH
vim.opt.tabstop = TABWIDTH
vim.opt.autoindent = true
vim.opt.expandtab = true

-- Highlight line the cursor is on
vim.wo.cursorline = true

-- Set Clipboard as standard copy paste buffer
vim.api.nvim_set_option("clipboard", "unnamedplus")

-- Enable LSP Diagnostic updates in insert mode
vim.diagnostic.config({update_in_insert = true})

-- Set tab width to 4 for js, html, vue, ts files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "vue", "js", "ts", "typescript", "javascript", "html", "css" },
  command = "setlocal shiftwidth=4 tabstop=4"
})