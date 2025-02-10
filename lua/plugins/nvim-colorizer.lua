local COLORIZER = {}

COLORIZER.load = function()
  return {
    "norcalli/nvim-colorizer.lua",
    config = function ()
      require("colorizer").setup()
    end
  }
end

return COLORIZER
