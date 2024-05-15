local WARDROBE = {}

WARDROBE.load = function()
  return {
    "EKQRCalamity/wardrobe.nvim",
    dependencies = require "colorschemes".colorschemes()
  }
end

WARDROBE.setup = function()
  local wardrobe = require("wardrobe")
  wardrobe.window.register_commands()
  wardrobe.window.register_theme()
  wardrobe.window.register_keymaps()
end

return WARDROBE