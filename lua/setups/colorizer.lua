local COLORIZE = {}

COLORIZE.load = function()
  return {
    'norcalli/nvim-colorizer.lua'
  }
end

COLORIZE.setup = function()
  require("colorizer").setup()
end

return COLORIZE