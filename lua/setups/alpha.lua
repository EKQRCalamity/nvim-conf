local ALPHA = {}

ALPHA.load = function ()
  return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
      require("alpha").setup(require("alpha.themes.dashboard").config)
    end
  }
end

return ALPHA