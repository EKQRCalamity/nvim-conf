local AUTOPAIR = {}

AUTOPAIR.load = function()
  return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function ()
      require("nvim-autopairs").setup()
    end
  }
end

return AUTOPAIR
