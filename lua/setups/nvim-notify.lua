local NOTIFY = {}

NOTIFY.load = function()
  return {
    "rcarriga/nvim-notify",
    name = "notify"
  }
end

NOTIFY.setup = function()
  vim.notify = require("notify")
end

return NOTIFY