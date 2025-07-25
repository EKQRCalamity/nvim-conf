local aicompanion = require "plugins/aicompanion"
local ai_plugins = require "plugins/aicomp-plugins"
local autopair = require "plugins/autopair"
local bufferline = require "plugins/bufferline"
local emmet = require "plugins/emmet"
local indent_blankline = require "plugins/indent-blankline"
local lspsetup = require "plugins/lspsetup"
local lualine = require "plugins/lualine"
local luasnip = require "plugins/luasnip"
local nvimcolorizer = require "plugins/nvim-colorizer"
local nvimtree = require "plugins/nvim-tree"
local telescope = require "plugins/telescope"
local treesitter = require "plugins/treesitter"
local vimcool = require "plugins/vim-cool"
local wardrobe = require "plugins/wardrobe"
local whichkey = require "plugins/whichkey"
local timar = require "plugins/timar"

local lazy_opts = {}

local lazy_plugins = {
  ai_plugins.markdown.load(),
  ai_plugins.diff.load(),
  ai_plugins.img_clip.load(),
  aicompanion.load(),
  autopair.load(),
  bufferline.load(),
  emmet.load(),
  indent_blankline.load(),
  nvimcolorizer.load(),
  nvimtree.load(),
  telescope.load(),
  treesitter.load(),
  vimcool.load(),
  wardrobe.load(),
  whichkey.load(),
  lualine.load(),
  luasnip.load(),
  lspsetup.load(),
}

require("lazy").setup(lazy_plugins, lazy_opts)


lspsetup.setup()

treesitter.update()

aicompanion.setup()
lualine.setup()
indent_blankline.setup()
nvimtree.setup()
bufferline.setup()
wardrobe.setup()

timar.setup("right")
