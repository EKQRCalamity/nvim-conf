local LSPSETUP = {}

local necessary_servers = {
  rust_analyzer = {},
  gopls = {},
  lua_ls = {},
  intelephense = {},
}

local ls_settings = {
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          "vim",
        }
      }
    },
    ["rust_analyzer"] = {
      diagnostics = {
        enable = true,
      }
    },
  }
}

LSPSETUP.load = function()
  return {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/nvim-cmp",
  }
end

LSPSETUP.setup = function()
  local lspdefaults = require("lspconfig").util.default_config
  local cmp = require("cmp")
  lspdefaults.capabilities = vim.tbl_deep_extend(
    "force",
    lspdefaults.capabilities,
    require("cmp_nvim_lsp").default_capabilities()
  )
  require("mason").setup({
    PATH = "prepend"
  })
  require("mason-lspconfig").setup({
    ensure_installed = vim.tbl_keys(necessary_servers),
    handlers = {
      function(server)
        require("lspconfig")[server].setup(ls_settings)
      end
    },
  })

  cmp.setup({
    sources = {
      {name = "nvim_lsp"},
    },
    mapping = cmp.mapping.preset.insert({
      ["<Tab>"] = cmp.mapping.confirm({select=false}),
    }),
    snippet = {
      expand = function (args)
        vim.snippet.expand(args.body)
      end,
    },
  })
end

return LSPSETUP
