-- Variable for tab width
local TABWIDTH = 2

-- Enable termguicolors
vim.opt.termguicolors = true

-- Change command area height when not in use
vim.opt.cmdheight = 1

-- Set <leader> and <localleader>
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Enable hybrid mode by default (!rnu and !nu)
vim.wo.nu = true
vim.wo.rnu = true

-- Set Tabwidth, autoident, etc.
vim.opt.shiftwidth = TABWIDTH
vim.opt.softtabstop = TABWIDTH
vim.opt.tabstop = TABWIDTH
vim.opt.autoindent = true
vim.opt.expandtab = true

-- Switch between 2 and 4 tabsize
vim.api.nvim_create_user_command('ToggleTabSize', function()
  local current_tabstop = vim.bo.tabstop
  if current_tabstop == 2 then
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
    print("Switched to 4-space indentation")
  else
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
    print("Switched to 2-space indentation")
  end
end, {})

-- Display line the cursor currently is on with highlight
vim.wo.cursorline = true

-- Set vim default clipboard to systemkeyboard (unnamedplus)
vim.api.nvim_set_option("clipboard", "unnamedplus")

-- Enable lsp diagnostic updates in insert mode
vim.diagnostic.config({
	update_on_insert = true
})
