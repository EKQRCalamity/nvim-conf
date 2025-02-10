local AICOMPANION = {}

AICOMPANION.load = function()
  return {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      
    },
    config = true
  }
end

return AICOMPANION
