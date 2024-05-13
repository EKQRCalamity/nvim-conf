-- Setup base nvim configurations
require "configs/nvimconf"

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
    -- Uncomment lines for colorscheme configuration
    --'maxmx03/fluoromachine.nvim',
    --'olivercederborg/poimandres.nvim',
    'ramojus/mellifluous.nvim',
    lazy = false,
    priority = 1000,
    config = function ()
      --[[
      require("fluoromachine").setup {
    	  glow = true,
        brightness = 1,
        theme = 'retrowave'
      }
      
      
      require("poimandres").setup {
        bold_vert_split = false, -- use bold vertical separators
        dim_nc_background = false, -- dim 'non-current' window backgrounds
        disable_background = false, -- disable background
        disable_float_background = false, -- disable background for floats
        disable_italics = false, -- disable italics
      }
      ]]

      require("mellifluous").setup({
        plugins = {
          cmp = true,
          nvim_tree = {
            enabled = true,
            show_root = true,
          },
          telescope = {
            enabled = true,
          }
        }
      })

      -- vim.cmd.colorscheme = "fluoromachine"
      -- vim.cmd.colorscheme = "poimandres"
      vim.cmd.colorscheme 'mellifluous'
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
  -- Rust - Uncommented in this case since we already install rust_analyzer and for me personally the stock rust analyzer works way better.
  --[[ 
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    lazy = false, -- This plugin is already lazy
  },]]
  -- NvimTree
  {
    "nvim-tree/nvim-tree.lua"
  },
  {
    'wakatime/vim-wakatime',
    lazy = false
  },
  -- Bufferline for topbar
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons'
  },
  --[[ Barbar for topbar
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },]]
  -- Vim CMP - Autocompletion
  {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "dcampos/nvim-snippy",
    "dcampos/cmp-snippy"
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
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
require("bufferline").setup({})
require("lualine").setup({
  options = {
    icons_enabled = true,
    -- Disable status line for nvimtree 
    disabled_filetypes = { 'NvimTree', 'NVimTree' },
    -- theme = "wombat",
    theme = "palenight"
  }
})

-- indent-blankline setup

local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require("ibl.hooks")

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

require("ibl").setup({
  indent = {
    highlight = highlight,
  }
})

local cmp = require("cmp")

local snippy = require("snippy")

snippy.setup({})

require("cmp").setup({
  snippet = {
    expand = function(args)
      snippy.expand_snippet(args.body)
    end
  },
  window = {
    completion = cmp.config.window.bordered()
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'snippy' },
    { name = 'buffer' }
  })
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local servers = {
  gopls = {},
  biome = {},
  lua_ls = {},
  volar = {},
  rust_analyzer = {}
}

local mason_lsp = require("mason-lspconfig")

mason_lsp.setup({
  ensure_installed = vim.tbl_keys(servers),
})

mason_lsp.setup_handlers({
  function(servername)
    require("lspconfig")[servername].setup({
      capabilities = capabilities,
      settings = servers[servername],
    })
  end,
})

-- Require mappings for custom keybindings - Has to be included AFTER telescope was setup.
require "mappings"