local WARDROBE = {}

WARDROBE.load = function()
  return {
    "EKQRCalamity/wardrobe.nvim",
    dependencies = require "colorschemes".colorschemes()
  }
end


-- For development
--[[WARDROBE.load = function()
  vim.opt.runtimepath:append("C:\\Users\\ekqrc\\Programming\\nvim\\plugins\\wardrobe.nvim\\")
end]]


WARDROBE.setup = function()
  -- For development
  --WARDROBE.load()
  local wardrobe = require("wardrobe")
  wardrobe.window.register_commands()
  wardrobe.window.register_theme()
  wardrobe.window.register_keymaps()
end


return WARDROBE
