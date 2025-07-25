local AICOMPANION = {}

AICOMPANION.load = function()
  return {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {}
  }
end

AICOMPANION.setup = function()
  require("codecompanion").setup({
    strategies = {
      chat = {
        adapter = "copilot",
        model = "claude-sonnet-4-20250514",
      },
      inline = {
        adapter = "copilot",
      },
    },
  })
end

return AICOMPANION
