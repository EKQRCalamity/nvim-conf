-- Setup base nvim configurations
require "configs/nvimconf"
local colorschemes = require "colorschemes"
local alpha = require "setups/alpha"
local bufferline = require "setups/bufferline"
local cmp = require "setups/cmp"
local dap_ui = require "setups/dap-ui"
local indent_blankline = require "setups/indent-blankline"
local lualine = require "setups/lualine"
local luasnip = require "setups/luasnip"
local mason = require "setups/mason"
local null_ls = require "setups/null-ls"
local notify = require "setups/nvim-notify"
local nvimtree = require "setups/nvim-tree"
local telescope = require "setups/telescope"
local treesitter = require "setups/treesitter"
local waka = require "setups/wakatime"
local wardrobe = require "setups/wardrobe"

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
  -- Available: fluoromachine, nightfox, bamboo, poimandres, mellifluous, oldworld, moonfly, catppuccin, citruszest,
  -- oh-lucy, minimal, modus, everblush, evergarden
  -- nightfox (specify mode in function e.g. dayfox => colorschemes.nightfox("day") | blank = default nightfox)
  -- bamboo (multiplex/greener, light and vulgaris/default)
  -- oh-lucy (evening and default)
  -- minimal (base16 and default)
  -- modus (operandi (light) and default/vivendi (dark))
  -- evergarden (high, low and medium/default)
  colorschemes.oh_lucy(),
  -- Telescope
  telescope.load(),
  -- Tree Sitter
  treesitter.load(),
  -- Mason
  mason.load(),
  -- DAP UI
  dap_ui.load(),
  -- NvimTree
  nvimtree.load(),
  -- Wakatime
  waka.load(),
  -- Bufferline for topbar
  bufferline.load(),
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
}
local opts  = {}

-- Setup Plugins
require("lazy").setup(plugs, opts)

wardrobe.setup()

mason.setup()
nvimtree.setup()

bufferline.setup()

lualine.setup()

luasnip.setup()

null_ls.setup()

-- Set vim notifications to use nvim notify
notify.setup()

indent_blankline.setup()

cmp.setup()

-- Require mappings for custom keybindings - Has to be included AFTER telescope was setup.
require "mappings"