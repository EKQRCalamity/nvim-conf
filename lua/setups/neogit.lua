local NEOGIT = {}

NEOGIT.load = function()
  return
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    }
  }
end

return NEOGIT