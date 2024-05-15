local TREESITTER = {}

TREESITTER.load = function()
  return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      vim.cmd(":TSUpdate")
    end
  }
end

return TREESITTER