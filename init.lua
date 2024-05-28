-- Setup base nvim configurations
require "configs/nvimconf"
local colorschemes = require "colorschemes"
local alpha = require "setups/alpha"
local bufferline = require "setups/bufferline"
local cmp = require "setups/cmp"
local colorize = require "setups/colorizer"
local dap_ui = require "setups/dap-ui"
local emmet = require "setups/emmet"
local indent_blankline = require "setups/indent-blankline"
local lualine = require "setups/lualine"
local lsp_zero = require "setups/lsp-zero"
local luasnip = require "setups/luasnip"
local mason = require "setups/mason"
local neogit = require "setups/neogit"
local null_ls = require "setups/null-ls"
local notify = require "setups/nvim-notify"
local nvimtree = require "setups/nvim-tree"
local surround = require "setups/surround"
local telescope = require "setups/telescope"
local tima = require "setups/tima"
local treesitter = require "setups/treesitter"
local vim_closer = require "setups/vim-closer"
local vim_cool = require "setups/vim-cool"
local waka = require "setups/wakatime"
local wardrobe = require "setups/wardrobe"

tima.setup("right")

-- Lazy.nvim - Package Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugs = {
  -- Colorscheme
  -- This is now only used as preset
  -- Available: fluoromachine, nightfox, bamboo, poimandres, mellifluous, oldworld, moonfly, catppuccin, citruszest,
  -- oh-lucy, minimal, modus, everblush, evergarden
  -- nightfox (specify mode in function e.g. dayfox => colorschemes.nightfox("day") | blank = default nightfox)
  -- bamboo (multiplex/greener, light and vulgaris/default)
  -- oh-lucy (evening and default)
  -- minimal (base16 and default)
  -- modus (operandi (light) and default/vivendi (dark))
  -- evergarden (high, low and medium/default)
  colorschemes.oh_lucy(),
  -- Colorize color codes
  colorize.load(),
  -- vim-closer for autoclosing brackets
  vim_closer.load(),
  -- vim-cool for disabling search highlights when you finished searching
  vim_cool.load(),
  -- Telescope
  telescope.load(),
  -- Tree Sitter
  treesitter.load(),
  -- DAP UI
  dap_ui.load(),
  -- Emmet - For Web Dev
  emmet.load(),
  -- NvimTree
  nvimtree.load(),
  -- Surround
  surround.load(),
  -- Wakatime
  waka.load(),
  -- Bufferline for topbar
  bufferline.load(),
  -- LSP Zero - Easier setup of cmp and luasnip
  lsp_zero.load(),
  -- Mason
  mason.load(),
  -- Vim CMP - Autocompletion
  cmp.load(),
  -- Lua snip, snippet manager
  luasnip.load(),
  -- Indent Blankline
  indent_blankline.load(),
  -- Lualine for status line
  lualine.load(),
  -- Start screen
  alpha.load(),
  -- Nvim notify for beautiful notifications
  notify.load(),
  -- None ls, community maintained child of null-ls
  null_ls.load(),
  -- Wardrobe - Colorscheme/Theme Chooser
  wardrobe.load(),

  -- Neogit - Git integration
  neogit.load(),
  { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},

}
local opts  = {}

-- For development
-- Uncomment wardrobe.load() in lazy setup and change the wardrobe.lua setup file accordingly!

-- Setup Plugins
require("lazy").setup(plugs, opts)

colorize.setup()

wardrobe.setup()

lsp_zero.setup()

cmp.setup()

mason.setup()
nvimtree.setup()

bufferline.setup()

lualine.setup()

luasnip.setup()

null_ls.setup()

-- Set vim notifications to use nvim notify
notify.setup()

indent_blankline.setup()

-- Require mappings for custom keybindings - Has to be included AFTER telescope was setup.
require "mappings"