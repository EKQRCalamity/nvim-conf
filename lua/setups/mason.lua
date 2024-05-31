local MASON = {}

local servers = {
  gopls = {},
  lua_ls = {},
  volar = {},
  rust_analyzer = {},
  harper_ls = {},
  tsserver = {},
  zls = {},
  omnisharp = {},
  -- phpactor = {},
  intelephense = {}
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
  require("mason").setup({
    PATH = "prepend"
  })
  local mason_lsp = require("mason-lspconfig")
  mason_lsp.setup({
    ensure_installed = vim.tbl_keys(servers),
    handlers = { lsp_zero.default_setup }
  })
end


return MASON
