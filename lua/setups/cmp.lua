local CMP = {}

-- LOAD Lua Snip before CMP
CMP.load = function()
  return {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
  }
end

CMP.setup = function()
  require("cmp").setup({
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end
    },
    window = {
      completion = require("cmp").config.window.bordered()
    },
    mapping = require("cmp").mapping.preset.insert({
      ['<C-b>'] = require("cmp").mapping.scroll_docs(-4),
      ['<C-f>'] = require("cmp").mapping.scroll_docs(4),
      ['<C-Space>'] = require("cmp").mapping.complete(),
      ['<C-e>'] = require("cmp").mapping.abort(),
      ['<CR>'] = require("cmp").mapping.confirm({ select = true }),
    }),
    sources = require("cmp").config.sources({
      { name = "nvim-lsp" },
      { name = "luasnip" },
      { name = "buffer" }
    })
  })
end

return CMP