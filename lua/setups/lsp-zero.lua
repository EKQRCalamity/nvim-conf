local ZERO = {}

-- LOAD Lua Snip before CMP
ZERO.load = function()
  return {
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
  }
end

ZERO.setup = function()
  _G.lsp_zero = require("lsp-zero")
  _G.lsp_zero.on_attach(function(_, bufnr)
    _G.lsp_zero.default_keymaps({bufnr = bufnr})
  end)
  _G.lsp_zero.configure("lua_ls", {
    settings = {
      Lua = {
        diagnostics = {
          globals = {
            "vim"
          }
        }
      }
    }
  })
end

return ZERO