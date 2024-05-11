-- Set intend
intend = 2

-- Set leader and local leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

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
  }
}
local opts  = {}

require("lazy").setup(plugs, opts)
require("mason").setup()

-- Telescope local setop
local builtin = require("telescope.builtin")

-- Telescope Find Files keybinds
vim.keymap.set('n', '<C-i>', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- Telescope Grep keybinds
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})

-- Tabwidth, etc
vim.cmd("set expandtab")
vim.cmd("set shiftwidth=" .. intend)
vim.cmd("set softtabstop=" .. intend)
vim.cmd("set tabstop=" .. intend)

-- Set Clipboard as standard copy paste buffer
vim.api.nvim_set_option("clipboard", "unnamed")
