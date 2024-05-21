local MASON = {}

local servers = {
  gopls = {},
  biome = {},
  lua_ls = {},
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
    ensure_installed = vim.tbl_keys(servers),
    handlers = { lsp_zero.default_setup }
  })
end


return MASON
