local TREE = {}

TREE.load = function()
  return {
    "nvim-tree/nvim-tree.lua"
  }
end

TREE.setup = function()
  require("nvim-tree").setup({
    view = {
      width = 28,
    }
  })
end

return TREE
