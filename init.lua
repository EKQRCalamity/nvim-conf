-- Set intend
indent = 2

-- Enable 24bit terminal colors
vim.opt.termguicolors = true

-- Set leader and local leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Disable netrw for NvimTree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
  {
    'maxmx03/fluoromachine.nvim',
    config = function ()
      local fm = require 'fluoromachine'

      fm.setup {
    	  glow = true,
        brightness = 1,
        theme = 'retrowave'
      }

      vim.cmd.colorscheme 'fluoromachine'
    end
  },
  -- Telescope
  { 
    'nvim-telescope/telescope-fzf-native.nvim', 
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' 
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep' }
  },
  -- Tree Sitter
  {
     'nvim-treesitter/nvim-treesitter',
     config = function () 
       vim.cmd(":TSUpdate")
     end
  },
  -- Mason
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    'mfussenegger/nvim-dap',
    'mfussenegger/nvim-lint',
    'mhartington/formatter.nvim'
  },
  { 
    "rcarriga/nvim-dap-ui", 
    dependencies = {
      "mfussenegger/nvim-dap", 
      "nvim-neotest/nvim-nio"
    } 
  },
  -- Rust
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  -- NvimTree
  {
    "nvim-tree/nvim-tree.lua"
  }
}
local opts  = {}

-- Setup Plugins
require("lazy").setup(plugs, opts)
require("mason").setup()
require("nvim-tree").setup({
  view = {
    width = 20,
  }
})


-- Telescope local setop
local builtin = require("telescope.builtin")

-- Telescope Find Files keybinds
vim.keymap.set('n', '<C-i>', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- Nvim Tree Toggle (CHANGE THIS I USE SHIFT+- WHICH RESULTS IN "_" ON MY LAYOUT)
vim.keymap.set({ "n", "c", "v", "t", "s", "o", "l"}, "_", "<cmd>:NvimTreeToggle<CR>")

-- Telescope Grep keybinds
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})

-- Tabwidth, etc
vim.bo.expandtab = true
vim.bo.shiftwidth = indent
vim.bo.softtabstop = indent
vim.bo.tabstop = indent
vim.bo.autoindent = indent

-- Set Clipboard as standard copy paste buffer
vim.api.nvim_set_option("clipboard", "unnamed")

-- Make it possible to exit with <Esc> from terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
