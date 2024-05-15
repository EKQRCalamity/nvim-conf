local DAPUI = {}

DAPUI.load = function()
  return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    }
  }
end

return DAPUI