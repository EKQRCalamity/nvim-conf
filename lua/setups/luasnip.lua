local LUASNIP = {}

LUASNIP.load = function()
  return {
    "L3MON4D3/LuaSnip",
    version = "2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },

  }
end

LUASNIP.setup = function()
  require("luasnip.loaders.from_vscode").lazy_load()
end

return LUASNIP