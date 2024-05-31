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
  _G.lsp_zero.configure("intelephense", {
    filetypes = { "php" },
    root_dir = require("lspconfig").util.root_pattern(".git"),
  })
  _G.lsp_zero.configure("phpactor", {
    cmd = { "phpactor", "language-server", "-vvv"},
    filetypes = { "php" },
    root_dir = require("lspconfig").util.root_pattern(".git"),
    init_options = {
      ["language_server_worse_reflection.inlay_hints.enable"] = true,
      ["language_server_worse_reflection.inlay_hints.params"] = true,
      ["language_server_worse_reflection.inlay_hints.types"] = true,
      ["language_server_configuration.auto_config"] = true,
      ["code_transform.import_globals"] = true,--[[
      ["language_server_phpstan.enabled"] = true,
      ["language_server_phpstan.level"] = 7,
      ["language_server_phpstan.bin"] = "phpstan",
      ]]
    },
  })
end

return ZERO