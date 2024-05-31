local NOTIFY = {}

NOTIFY.load = function()
  return {
    "rcarriga/nvim-notify",
    name = "notify"
  }
end

NOTIFY.setup = function()
  require("notify").setup({
    background_colour = "#000000",
  })
  vim.notify = require("notify")
end

return NOTIFY
