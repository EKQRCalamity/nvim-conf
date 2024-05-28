local NULL_LS = {}

NULL_LS.load = function()
  return {
    "nvimtools/none-ls.nvim"
  }
end

NULL_LS.setup = function()
  require("null-ls").setup({
    sources = {
      require("null-ls").builtins.formatting.stylua,
      require("null-ls").builtins.completion.spell,
      require("null-ls").builtins.completion.tags,
      require("null-ls").builtins.completion.luasnip,
      require("null-ls").builtins.diagnostics.codespell,
      require("null-ls").builtins.diagnostics.djlint,
      require("null-ls").builtins.diagnostics.golangci_lint,
      require("null-ls").builtins.diagnostics.ktlint,
      require("null-ls").builtins.formatting.dxfmt,
      require("null-ls").builtins.formatting.uncrustify,
      require("null-ls").builtins.diagnostics.todo_comments,
      require("null-ls").builtins.diagnostics.trail_space
    }
  })
end

return NULL_LS