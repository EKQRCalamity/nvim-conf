local BUFFERLINE = {}

BUFFERLINE.load = function()
  return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  }
end

BUFFERLINE.setup = function()
  require("bufferline").setup({})
end

return BUFFERLINE