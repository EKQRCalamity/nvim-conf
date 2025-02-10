local NVIM_TREE = {}

NVIM_TREE.load = function()
  return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  }
end

NVIM_TREE.setup = function()
  -- Disable netrw
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
  require("nvim-tree").setup({
    view = {
      width = 28,
    },
    git = {
      enable = true,
      ignore = false,
    }
  })
end

return NVIM_TREE
