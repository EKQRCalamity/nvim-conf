local MASON = {}

local servers = {
  gopls = {},
  biome = {},
  lua_ls = {
    Lua = {
      diagnostics = {
        -- Add vim to recognized globals
        globals = {
          'vim'
        }
      }
    }
  },
  volar = {},
  rust_analyzer = {}
}

MASON.load = function()
  return {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    'mfussenegger/nvim-dap',
    'mfussenegger/nvim-lint',
    'mhartington/formatter.nvim',
  }
end

MASON.setup = function()
  require("mason").setup({})
  local mason_lsp = require("mason-lspconfig")
  mason_lsp.setup({
    ensure_installed = vim.tbl_keys(servers)
  })
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

  mason_lsp.setup_handlers({
    function(servername)
      require("lspconfig")[servername].setup({
        capabilities = capabilities,
        settings = servers[servername]
      })
    end,
  })
end


return MASON